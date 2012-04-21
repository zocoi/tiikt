require "minitest_helper"

describe Task do
  fixtures :tasks
  
  let(:task) { tasks(:sample_task) }
  
  it "includes name in to_param" do
    product = Product.create!(name: "Hello World")
    product.to_param.must_equal "#{product.id}-hello-world"
  end
end