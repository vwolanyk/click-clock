require 'rails_helper'

RSpec.describe "WorkLogs", type: :request do
  describe "GET /work_logs" do
    it "works! (now write some real specs)" do
      get work_logs_path
      expect(response).to have_http_status(200)
    end
  end
end
