require 'spec_helper'

describe Lesson do

  it "should respond to name" do
    Lesson.new.should respond_to(:name)
  end

  it "should respond to description" do
    Lesson.new.should respond_to(:description)
  end

  it "should respond to body" do
    Lesson.new.should respond_to(:body)
  end

  it "should respond to unit" do
    Lesson.new.should respond_to(:unit)
  end

  it "should respond to lesson_number" do
    Lesson.new.should respond_to(:lesson_number)
  end

  describe "validations" do

    before(:each) do
      @valid_attrs = {
        name: "I/O pins",
        description: "I/O pins are awesome!",
        body: "I/O pins are awesome!",
        unit_id: 1,
        lesson_number: 1
      }
    end

    it "should not be valid without name" do
      @valid_attrs.delete :name
      Lesson.new(@valid_attrs).should_not be_valid
    end

    it "should not be valid without description" do
      @valid_attrs.delete :description
      Lesson.new(@valid_attrs).should_not be_valid
    end

    it "should not be valid without body" do
      @valid_attrs.delete :body
      Lesson.new(@valid_attrs).should_not be_valid
    end

    it "should not be valid without unit_id" do
      @valid_attrs.delete :unit_id
      Lesson.new(@valid_attrs).should_not be_valid
    end

    it "should not be valid without lesson_number" do
      @valid_attrs.delete :lesson_number
      Lesson.new(@valid_attrs).should_not be_valid
    end

    it "should not have same lesson_number in same unit" do
      Lesson.create(@valid_attrs)
      @valid_attrs[:name] = "what is an MCU's" #so doesn't interfere with check in future
      @valid_attrs[:description] = "what is an MCU's" #so doesn't interfere with check in future
      Lesson.new(@valid_attrs).should_not be_valid
    end

    it "should be able to have same unit_number with different course" do
      Lesson.create(@valid_attrs)
      @valid_attrs[:name] = "what is an MCU's" #so doesn't interfere with check in future
      @valid_attrs[:description] = "what is an MCU's" #so doesn't interfere with check in future
      @valid_attrs[:unit_id] = 2
      Lesson.new(@valid_attrs).should be_valid
    end

  end

end
