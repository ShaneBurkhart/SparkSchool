require 'spec_helper'

describe Blog do

  before(:each) do
    @blog = Blog.new
  end

  it "should respond to title" do
    @blog.should respond_to(:title)
  end

  it "should respond to title" do
    @blog.should respond_to(:title)
  end

end
