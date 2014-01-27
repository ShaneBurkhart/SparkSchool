require 'spec_helper'

describe Blog do

  before(:each) do
    @blog = Blog.new
    @valid_attrs = {
      title: "Great post",
      body: "Amazing body",
      tag: "Electronics"
    }
  end

  it "should respond to title" do
    @blog.should respond_to(:title)
  end

  it "should respond to body" do
    @blog.should respond_to(:body)
  end

  it "should respond to tag" do
    @blog.should respond_to(:tag)
  end

  context "when brand new" do
    it "should be invalid with no attrs" do
      @blog.should_not be_valid
    end
  end

  context "when missing one attr" do
    it "should be invalid with no title" do
      @valid_attrs.delete :title
      @blog.attributes = @valid_attrs
      @blog.should_not be_valid
    end

    it "should be invalid with no body" do
      @valid_attrs.delete :body
      @blog.attributes = @valid_attrs
      @blog.should_not be_valid
    end

    it "should be invalid with no tag" do
      @valid_attrs.delete :tag
      @blog.attributes = @valid_attrs
      @blog.should_not be_valid
    end
  end

end
