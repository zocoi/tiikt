require "minitest_helper"

describe TaskController do
  context "index action" do
    before do
      get :index
    end
    it { must_respond_with :success }
    # it "must render index json" do
    #       must_render_template :index
    #     end
  end
end