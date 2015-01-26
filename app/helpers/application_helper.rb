module ApplicationHelper

  # § change this.
  def is_super_admin?
    true
  end

  def some_random_phrase
    array = ["cool beans", "cool bananas", "baked beans", "ruby on rails"].shuffle
    "e.g, " + array.pop
  end

  def some_random_tags
    array = ["HTML5", "CSS", "Javascript", "PHP", "Java", "Ruby", "Python"].shuffle
    "e.g, " + array.pop + ", " + array.pop + ", " + array.pop
  end

end
