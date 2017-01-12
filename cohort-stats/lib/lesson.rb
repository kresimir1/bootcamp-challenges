class Lesson
  attr_accessor :name, :body
  def initialize(name, body)
    @name = name
    @body = body
  end

  def submittable?
    false
  end
end
