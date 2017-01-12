require "spec_helper"

describe Video do
  describe ".new" do
    it "takes a name and body as arguments" do
      student = Video.new("Lesson1", "You will learn a lot from this lesson", "http://stackoverflow.com/questions/6245929/check-for-array-not-empty-any")
      expect(student).to be_a(Video)
    end
  end

  let(:lesson) { Video.new("Lesson1", "You will learn a lot from this lesson", "http://stackoverflow.com/questions/6245929/check-for-array-not-empty-any") }

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
  describe "#url" do
    it "has a reader for url" do
      expect(lesson.url).to eq("http://stackoverflow.com/questions/6245929/check-for-array-not-empty-any")
    end
    it "does not have a writer for url" do
      expect { lesson.url = "https://repl.it/C72o/13" }.to raise_error(NoMethodError)
    end
  end


end
