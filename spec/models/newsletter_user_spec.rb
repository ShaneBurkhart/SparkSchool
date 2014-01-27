require 'spec_helper'

describe NewsletterUser do

  before(:each) do
    @newsletter_user = NewsletterUser.new
    @valid_attrs = {
      email: "shaneburkhart@gmail.com"
    }
  end

  context "when brand new" do
    it "should be invalid" do
      @newsletter_user.should_not be_valid
    end
  end

  context "when has valid attr" do
    it "should be valid and save" do
      @newsletter_user.attributes = @valid_attrs
      @newsletter_user.save.should be_true
    end
  end

end
