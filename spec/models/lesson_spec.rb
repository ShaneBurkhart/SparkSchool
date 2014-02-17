require 'spec_helper'

describe Lesson do

  before do
    create(:course, id: 1)
    create(:unit, id: 1)
  end

  subject { create(:lesson) }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:body) }
  it { should respond_to(:unit) }
  it { should respond_to(:lesson_number) }
  it { should respond_to(:ratings) }

  describe "validations" do

    context "when missing attributes" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:body) }
      it { should validate_presence_of(:unit_id) }
      it { should validate_presence_of(:lesson_number) }
    end

    context "when lesson_number exists" do
      it { expect(build(:lesson, lesson_number: subject.lesson_number)).to_not be_valid }
    end

    context "when same lesson_number but different unit" do
      before { create(:unit, id: 2) }
      it { should be_valid }
      it { expect(build(:lesson, unit_id: 2)).to be_valid }
    end

    context "when making relations" do
      subject { build(:lesson, unit_id: 3) }

      context "when unit doesn't exist" do
        it { should_not be_valid }
      end

      context "when unit exists" do
        before { create(:unit, id: 3) }
        it { should be_valid }
      end

    end

  end

end
