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

  describe "validation" do

    before(:each) do
      @invalid_emails = ["@asdf.asdf", "asdf@.com", "asdf@asdf."]
      @valid_emails = ["shaneburkhart@gmail.com", "me@example.com", "asdf@asdf.co"]
    end

    it "should be invalid with a blank email" do
      @valid_attrs.delete :email
      @newsletter_user.attributes = @valid_attrs
      @newsletter_user.email = ""
      @newsletter_user.save.should be_false
    end

    it "should be a valid email format" do
      @valid_attrs.delete :email
      @newsletter_user.attributes = @valid_attrs

      @valid_emails.each do |email|
        @newsletter_user.email = email
        @newsletter_user.should be_valid
      end

      @invalid_emails.each do |email|
        @newsletter_user.email = email
        @newsletter_user.should_not be_valid
      end
    end

    it "should be invalid when there is a duplicate" do
      @email = "shaneburkhart@gmail.com"
      NewsletterUser.find_or_create_by_email(@email)
      NewsletterUser.new(email: @email).should_not be_valid
    end

  end

  context "when has valid attr" do
    it "should be valid and save" do
      @newsletter_user.attributes = @valid_attrs
      @newsletter_user.save.should be_true
    end
  end

end
