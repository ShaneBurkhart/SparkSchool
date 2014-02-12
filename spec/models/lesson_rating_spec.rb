require 'spec_helper'

describe LessonRating do

  before do
    create(:lesson, id: 1)
  end

  let(:resource) { create(:lesson_rating) }

  it { expect(resource).to respond_to(:lesson_id) }
  it { expect(resource).to respond_to(:lesson) }
  it { expect(resource).to respond_to(:liked) }
  it { expect(resource).to respond_to(:like?) }
  it { expect(resource).to respond_to(:user_id) }
  it { expect(resource).to respond_to(:user) }

  describe "validations" do

    context "when missing attributes" do
      it { expect(build(:lesson_rating, lesson_id: nil)).to_not be_valid }
      it { expect(build(:lesson_rating, liked: nil)).to_not be_valid }
      it { expect(build(:lesson_rating, user_id: nil)).to_not be_valid }
    end

    context "when making relation" do

      describe "user" do
        let(:lesson_rating) { build(:lesson_rating, user_id: 3) }

        context "when doesn't exist" do
          it { expect(lesson_rating).to_not be_valid }
        end

        context "when exists" do
          before { create(:user, id: 3) }
          it { expect(lesson_rating).to be_valid }
        end

      end

      describe "lesson" do
        let(:lesson_rating) { build(:lesson_rating, lesson_id: 3) }

        context "when doesn't exist" do
          it { expect(lesson_rating).to_not be_valid }
        end

        context "when exists" do
          before { create(:lesson, id: 3) }
          it { expect(lesson_rating).to be_valid }
        end

      end

    end

  end

end
