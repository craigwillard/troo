require 'spec_helper'

describe "interviews/index" do
  before(:each) do
    assign(:interviews, [
      stub_model(Interview,
        :interviewee => nil,
        :interviewer => nil,
        :approve => false,
        :notes => "MyText"
      ),
      stub_model(Interview,
        :interviewee => nil,
        :interviewer => nil,
        :approve => false,
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of interviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
