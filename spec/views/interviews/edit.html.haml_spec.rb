require 'spec_helper'

describe "interviews/edit" do
  before(:each) do
    @interview = assign(:interview, stub_model(Interview,
      :interviewee => nil,
      :interviewer => nil,
      :approve => false,
      :notes => "MyText"
    ))
  end

  it "renders the edit interview form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => interviews_path(@interview), :method => "post" do
      assert_select "input#interview_interviewee", :name => "interview[interviewee]"
      assert_select "input#interview_interviewer", :name => "interview[interviewer]"
      assert_select "input#interview_approve", :name => "interview[approve]"
      assert_select "textarea#interview_notes", :name => "interview[notes]"
    end
  end
end
