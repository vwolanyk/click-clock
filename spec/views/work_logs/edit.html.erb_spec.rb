require 'rails_helper'

RSpec.describe "work_logs/edit", type: :view do
  before(:each) do
    @work_log = assign(:work_log, WorkLog.create!(
      :user => nil
    ))
  end

  it "renders the edit work_log form" do
    render

    assert_select "form[action=?][method=?]", work_log_path(@work_log), "post" do

      assert_select "input[name=?]", "work_log[user_id]"
    end
  end
end
