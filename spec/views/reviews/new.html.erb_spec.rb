require 'spec_helper'

describe "reviews/new" do
  before(:each) do
    assign(:review, stub_model(Review,
      :title => "MyString",
      :author => "MyString",
      :rating => 1,
      :content => "MyText",
      :product => nil
    ).as_new_record)
  end

  it "renders new review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reviews_path, :method => "post" do
      assert_select "input#review_title", :name => "review[title]"
      assert_select "input#review_author", :name => "review[author]"
      assert_select "input#review_rating", :name => "review[rating]"
      assert_select "textarea#review_content", :name => "review[content]"
      assert_select "input#review_product", :name => "review[product]"
    end
  end
end
