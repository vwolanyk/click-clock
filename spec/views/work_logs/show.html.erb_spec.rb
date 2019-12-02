require 'rails_helper'

RSpec.describe "work_logs/show", type: :view do
  before(:each) do
    @work_log = assign(:work_log, WorkLog.create!(
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
