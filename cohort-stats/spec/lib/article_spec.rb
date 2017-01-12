require "spec_helper"

describe Article do
  describe ".new" do
    it "takes a name and body as arguments" do
      student = Article.new("Lesson1", "You will learn a lot from this lesson")
      expect(student).to be_a(Article)
    end
  end

  let(:lesson) { Article.new("Lesson1", "You will learn a lot from this lesson") }

  describe "#name" do
    it "has a reader for name" do
      expect(lesson.name).to eq("Lesson1")
    end

    it "does has a writer for name" do
      lesson.name = "Lesson 2"
      expect(lesson.name).to eq("Lesson 2")
    end
  end

  describe "#body" do
    it "has a reader for body" do
      expect(lesson.body).to eq("You will learn a lot from this lesson")
    end

    it "does has a writer for email" do
      lesson.body = "You will learn nothing from this"
      expect(lesson.body).to eq("You will learn nothing from this")
    end
  end
  describe "#submittable?" do
    it "will return false"do
      expect(lesson.submittable?).to eq(false)
    end

  end
end
