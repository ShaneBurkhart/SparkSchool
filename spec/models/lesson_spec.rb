require 'spec_helper'

describe Lesson do

  before do
    create(:course, id: 1)
    create(:unit, id: 1)
  end

  let(:resource) { create(:lesson) }

  it { expect(resource).to respond_to(:name) }
  it { expect(resource).to respond_to(:description) }
  it { expect(resource).to respond_to(:body) }
  it { expect(resource).to respond_to(:unit) }
  it { expect(resource).to respond_to(:lesson_number) }
  it { expect(resource).to respond_to(:ratings) }

  describe "validations" do

    context "when missing attributes" do
      it { expect(build(:lesson, name: nil)).to_not be_valid }
      it { expect(build(:lesson, description: nil)).to_not be_valid }
      it { expect(build(:lesson, body: nil)).to_not be_valid }
      it { expect(build(:lesson, unit_id: nil)).to_not be_valid }
      it { expect(build(:lesson, lesson_number: nil)).to_not be_valid }
    end

    context "when lesson_number exists" do
      it { expect(build(:lesson, lesson_number: resource.lesson_number)).to_not be_valid }
    end

    context "when same lesson_number but different unit" do
      before { create(:unit, id: 2) }
      it { expect(resource).to be_valid }
      it { expect(build(:lesson, unit_id: 2)).to be_valid }
    end

    context "when making relations" do
      it "has parent unit" do
        build(:lesson, unit_id: 3).should_not be_valid
        create(:unit, id: 3)
        build(:lesson, unit_id: 3).should be_valid
      end
    end

  end

end
