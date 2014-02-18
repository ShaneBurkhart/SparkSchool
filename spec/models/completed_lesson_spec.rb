require 'spec_helper'

describe CompletedLesson do
  before do
    create(:course, id: 1)
    create(:unit, id: 1)
    create(:lesson, id: 1)
    create(:user, id: 1)
  end

  subject { create(:completed_lesson) }

  it { should respond_to(:lesson_id) }
  it { should respond_to(:lesson) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }

  describe "validations" do

    context "when missing attributes" do
      it { should validate_presence_of(:lesson_id) }
      it { should validate_presence_of(:lesson) }
      it { should validate_presence_of(:user_id) }
      it { should validate_presence_of(:user) }
    end

    context "when lesson_id and user_id already exists" do
      before { build(:completed_lesson, id: 1).save } # to save to db.  Probably something else wrong
      subject { build(:completed_lesson, id: nil) }
      it { should_not be_valid }
    end

    context "when user_id same but lesson_id different" do
      before { create(:lesson, id: 5) }
      subject { build(:completed_lesson, lesson_id: 5) }
      it { should be_valid }
    end

    context "when lesson_id same but user_id different" do
      before { create(:user, id: 5, email: "asdf@asdfdfsa.com") }
      subject { build(:completed_lesson, user_id: 5) }
      it { should be_valid }
    end

    context "when making relations" do

      describe "with user" do
        subject { build(:completed_lesson, user_id: 3) }

        context "when user doesn't exist" do
          it { should_not be_valid }
        end

        context "when user exists" do
          before { create(:user, id: 3, email: "asdf@asdffdsa.com") }
          it { should be_valid }
        end

      end

      describe "with lesson" do
        subject { build(:completed_lesson, lesson_id: 3) }

        context "when lesson doesn't exist" do
          it { should_not be_valid }
        end

        context "when lesson exists" do
          before { create(:lesson, id: 3) }
          it { should be_valid }
        end

      end

    end

  end

end
