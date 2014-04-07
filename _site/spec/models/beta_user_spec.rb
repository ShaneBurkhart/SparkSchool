require 'spec_helper'

describe BetaUser do

  before(:each) do
    @beta_user = BetaUser.new
    @valid_attrs = {
      email: "shaneburkhart@gmail.com",
      sign_up_form: "top"
    }
  end

  it "should respond to email" do
    @beta_user.should respond_to(:email)
  end

  it "should respond to sign_up_form" do
    @beta_user.should respond_to(:sign_up_form)
  end

  context "when brand new" do
    it "should be invalid" do
      @beta_user.should_not be_valid
    end
  end

  context "when one attr is missing" do
    it "should be invalid without email" do
      @valid_attrs.delete(:email)
      @beta_user.attributes = @valid_attrs
      @beta_user.should_not be_valid
    end

    it "should be valid without sign up form with default" do
      @valid_attrs.delete(:sign_up_form)
      @beta_user.attributes = @valid_attrs
      @beta_user.should be_valid
    end
  end

  context "when valid attrs" do
    it "should be valid and save" do
      @beta_user.attributes = @valid_attrs
      @beta_user.save.should be_true
    end
  end

end
