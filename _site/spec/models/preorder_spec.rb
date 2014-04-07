require 'spec_helper'

describe Preorder do

  subject { create(:preorder, id: 1) }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:full_name) }
  it { should respond_to(:email) }
  it { should respond_to(:address) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zipcode) }
  it { should respond_to(:stripe_customer_id) }

  describe "validations" do

    context "when missing attributes" do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:address) }
      it { should validate_presence_of(:city) }
      it { should validate_presence_of(:state) }
      it { should validate_presence_of(:zipcode) }
      it { should validate_presence_of(:stripe_customer_id) }
    end

    describe "email" do

      context "when invalid email" do
        before { subject.email = "asdfasdf$asdf!asdf"}
        it { should_not be_valid}
      end

      context "when valid email" do
        before { subject.email = "asdf@asdf.asdf"}
        it { should be_valid}
      end

    end

  end

end
