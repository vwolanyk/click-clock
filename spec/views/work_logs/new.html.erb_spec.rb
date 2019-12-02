require 'rails_helper'

RSpec.describe "work_logs/new", type: :view do
  before(:each) do
    assign(:work_log, WorkLog.new(
      :user => nil
    ))
  end

  it "renders new work_log form" do
    render

    assert_select "form[action=?][method=?]", work_logs_path, "post" do

      assert_select "input[name=?]", "work_log[user_id]"
    end
  end
end
