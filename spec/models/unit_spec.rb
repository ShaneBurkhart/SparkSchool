require 'spec_helper'

describe Unit do

  it "should respond to name" do
    Unit.new.should respond_to(:name)
  end

  it "should respond to course" do
    Unit.new.should respond_to(:course)
  end

  it "should respond to unit_number" do
    Unit.new.should respond_to(:unit_number)
  end

  it "should respond to lessons" do
    Unit.new.should respond_to(:lessons)
  end

  it "should respond to ordered_lessons" do
    Unit.new.should respond_to(:ordered_lessons)
  end

  describe "validations" do

    before(:each) do
      @valid_attrs = {
        name: "I/O pins",
        course_id: 1,
        unit_number: 1
      }
    end

    it "should not be valid without name" do
      @valid_attrs.delete :name
      Unit.new(@valid_attrs).should_not be_valid
    end

    it "should not be valid without course_id" do
      @valid_attrs.delete :course_id
      Unit.new(@valid_attrs).should_not be_valid
    end

    it "should not be valid without unit_number" do
      @valid_attrs.delete :unit_number
      Unit.new(@valid_attrs).should_not be_valid
    end

    it "should not have same unit_number in same course" do
      Unit.create(@valid_attrs)
      @valid_attrs[:name] = "what is an MCU's" #so doesn't interfere with check in future
      Unit.new(@valid_attrs).should_not be_valid
    end

    it "should be able to have same unit_number with different course" do
      Unit.create(@valid_attrs)
      @valid_attrs[:name] = "what is an MCU's" #so doesn't interfere with check in future
      @valid_attrs[:course_id] = 2
      Unit.new(@valid_attrs).should be_valid
    end

  end

end
