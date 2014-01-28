require 'spec_helper'

describe Course do

  it "should respond to name" do
    Course.new.should respond_to(:name)
  end

  it "should respond to description" do
    Course.new.should respond_to(:description)
  end

  it "should respond to units" do
    Course.new.should respond_to(:units)
  end

  describe "validations" do

    before(:each) do
      @valid_attrs = {
        name: "Microcontrollers",
        description: "Some awesome stuff about MCU's."
      }
    end

    it "should not be valid without name" do
      @valid_attrs.delete :name
      Course.new(@valid_attrs).should_not be_valid
    end

    it "should not be valid without description" do
      @valid_attrs.delete :description
      Course.new(@valid_attrs).should_not be_valid
    end

  end

end
