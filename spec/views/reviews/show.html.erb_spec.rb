require 'spec_helper'

describe "reviews/show" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :title => "Title",
      :author => "Author",
      :rating => 1,
      :content => "MyText",
      :product => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Author/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
