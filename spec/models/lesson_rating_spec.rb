require 'spec_helper'

describe LessonRating do

  it "responds to lesson_id" do
    Lesson.new.should respond_to(:lesson_id)
  end

  it "responds to lesson" do
    Lesson.new.should respond_to(:lesson)
  end

  it "responds to liked" do
    Lesson.new.should respond_to(:liked)
  end

  it "responds to liked?" do
    Lesson.new.should respond_to(:liked?)
  end

end
