require 'spec_helper'

describe LessonRating do

  before do
    create(:course, id: 1)
    create(:unit, id: 1)
    create(:lesson, id: 1)
    create(:user, id: 1)
  end

  subject { create(:lesson_rating, id: 1) }

  it { should respond_to(:lesson_id) }
  it { should respond_to(:lesson) }
  it { should respond_to(:liked) }
  it { should respond_to(:like?) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }

  describe "validations" do

    context "when missing attributes" do
      it { should validate_presence_of(:lesson_id) }
      it { should validate_presence_of(:liked) }
      it { should validate_presence_of(:user_id) }
    end

    context "when making relations with" do

      describe "user" do
        subject { build(:lesson_rating, user_id: 3) }

        context "when doesn't exist" do
          it { should_not be_valid }
        end

        context "when exists" do
          before { create(:user, id: 3, email: "someother@email.com") }
          it { should be_valid }
        end

      end

      describe "lesson" do
        subject { build(:lesson_rating, lesson_id: 3) }

        context "when doesn't exist" do
          it { should_not be_valid }
        end

        context "when exists" do
          before do
            create(:lesson, id: 3)
          end

          it { should be_valid }
        end

      end

    end

  end

end
