require 'spec_helper'

describe "interviews/new" do
  before(:each) do
    assign(:interview, stub_model(Interview,
      :interviewee => nil,
      :interviewer => nil,
      :approve => false,
      :notes => "MyText"
    ).as_new_record)
  end

  it "renders new interview form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => interviews_path, :method => "post" do
      assert_select "input#interview_interviewee", :name => "interview[interviewee]"
      assert_select "input#interview_interviewer", :name => "interview[interviewer]"
      assert_select "input#interview_approve", :name => "interview[approve]"
      assert_select "textarea#interview_notes", :name => "interview[notes]"
    end
  end
end
