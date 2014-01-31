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

  it "should respond to tag" do
    Course.new.should respond_to(:tag)
  end



  describe "validations" do

    before(:each) do
      @valid_attrs = {
        name: "Microcontrollers",
        description: "Some awesome stuff about MCU's.",
        tag: "MCU"
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

    it "should not be valid without tag" do
      @valid_attrs.delete :tag
      Course.new(@valid_attrs).should_not be_valid
    end

    it "should not be valid with duplicate tags" do
      @other_attrs = {
        name: "Some name",
        description: "A description",
        tag: @valid_attrs[:tag]
      }
      Course.create(@valid_attrs)
      Course.new(@other_attrs).should_not be_valid
    end
  end

end
