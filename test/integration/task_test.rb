require "minitest_helper"

describe "Task Integration Test" do
  
  context "task#index" do
    before do
      get "/task/index"
    end
  end
end
