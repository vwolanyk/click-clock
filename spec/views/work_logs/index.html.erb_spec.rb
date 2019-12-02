require 'rails_helper'

RSpec.describe "work_logs/index", type: :view do
  before(:each) do
    assign(:work_logs, [
      WorkLog.create!(
        :user => nil
      ),
      WorkLog.create!(
        :user => nil
      )
    ])
  end

  it "renders a list of work_logs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
