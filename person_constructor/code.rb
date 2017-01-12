class Person
  attr_reader :first_name,:middle_name, :last_name

  def initialize(name, last_name = nil, middle_name = nil)
    if last_name.nil?
      full_name = name.split
      @first_name = full_name[0]
      if full_name.length == 2
        @last_name = full_name[1]
      else
      @middle_name = full_name[1]
      @last_name = full_name[2]
      end
    elsif middle_name.nil?
      @first_name = name
      @last_name = last_name
    else
      @first_name = name
      @last_name = last_name
      @middle_name = middle_name
    end
  end
end
