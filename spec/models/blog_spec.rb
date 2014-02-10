require 'spec_helper'

describe Blog do

  before(:each) do
    @blog = Blog.new
    @valid_attrs = {
      title: "Great post",
      body: "Amazing body",
      tag: "Electronics",
      published: true
    }
  end

  it "should respond to title" do
    @blog.should respond_to(:title)
  end

  it "should respond to published" do
    @blog.should respond_to(:published)
  end

  it "should respond to published?" do
    @blog.should respond_to(:published?)
  end

  it "should respond to body" do
    @blog.should respond_to(:body)
  end

  it "should respond to tag" do
    @blog.should respond_to(:tag)
  end

  it "should respond to link_title" do
    @blog.should respond_to(:link_title)
  end

  it "should have proper link_title" do
    @title = "This is the best title  evvvaaarrrr-2222 !!!"
    @blog.title = @title
    @blog.link_title.should eq(@title.gsub(/[^a-zA-Z0-9\s\-]/, '').gsub(/\s+/, "-").gsub(/\-+\z/, '').downcase)
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
