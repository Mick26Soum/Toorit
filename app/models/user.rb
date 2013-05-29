# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)
#  password_digest        :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  username               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  auth_token             :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :username

  has_secure_password

  EMAIL_REGEX_EXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: EMAIL_REGEX_EXP }
  validates :password, presence: true, length: { minimum: 6}
  validates :password_confirmation, presence: true

  before_save { |user| user.email = email.strip.downcase }
  before_create { generate_token(:auth_token) }



  #method for sending password reset to user email
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save(:validate => false)
    UserMailer.password_reset(self).deliver
  end

  # pass in the column name as parameter to create the token for specific column
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end


  #validates_uniqueness_of :email
  #validates_format_of :email, format: => { with: /^[\w.+-]+@([\w]+.)+\w+$/ }
  #validates_presence_of :email


  #validate presence and confirmation of password field is automatically processed by has_secure_password

  #validates :email, uniqueness: true, presence: true, format: { with: /^[\w.+-]+@([\w]+.)+\w+$/ }

  #validate the confirmation of the email field
  #validates_confirmation_of :password   replace :password with field you'd like to confirm

end
