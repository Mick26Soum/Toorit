# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  username        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :username,
  :first_name, :last_name, :username

  has_secure_password

  before_save { |user| user.email = email.downcase }


  EMAIL_REGEX_EXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: EMAIL_REGEX_EXP }
  validates :password, presence: true, length: { minimum: 6}
  validates :password_confirmation, presence: true
  validates :username, presence: true, uniqueness: true


  #validates_uniqueness_of :email
  #validates_format_of :email, format: => { with: /^[\w.+-]+@([\w]+.)+\w+$/ }
  #validates_presence_of :email


  #validate presence and confirmation of password field is automatically processed by has_secure_password

  #validates :email, uniqueness: true, presence: true, format: { with: /^[\w.+-]+@([\w]+.)+\w+$/ }

  #validate the confirmation of the email field
  #validates_confirmation_of :password   replace :password with field you'd like to confirm

end
