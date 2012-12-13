require 'spec_helper'

describe "interviews/show" do
  before(:each) do
    @interview = assign(:interview, stub_model(Interview,
      :interviewee => nil,
      :interviewer => nil,
      :approve => false,
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
  end
end
