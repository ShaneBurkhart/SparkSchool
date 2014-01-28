require 'spec_helper'

describe IncomingMail do

  it "should respond to from" do
    IncomingMail.new.should respond_to(:from)
  end

  it "should respond to to" do
    IncomingMail.new.should respond_to(:to)
  end

  it "should respond to subject" do
    IncomingMail.new.should respond_to(:subject)
  end

  it "should respond to body" do
    IncomingMail.new.should respond_to(:body)
  end


  describe "validation" do

    before(:each) do
      @valid_attrs = {
        from: "me@domain.com",
        to: "you@domain.com",
        subject: "Your product is awesome!",
        body: "Blah Blah!"
      }
    end

    it "should be invalid without from" do
      @valid_attrs.delete :from
      IncomingMail.new(@valid_attrs).should_not be_valid
    end

    it "should be invalid without to" do
      @valid_attrs.delete :to
      IncomingMail.new(@valid_attrs).should_not be_valid
    end

    it "should be invalid without subject" do
      @valid_attrs.delete :subject
      IncomingMail.new(@valid_attrs).should_not be_valid
    end

    it "should be invalid without body" do
      @valid_attrs.delete :body
      IncomingMail.new(@valid_attrs).should_not be_valid
    end

  end
end
