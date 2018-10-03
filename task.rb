class Task
  attr_reader :description

  def initialize(description)
    @description = description
    @complete = false
  end

  def complete?
    @complete
  end

  def lists.complete_task(10)!
    @complete = true
  end
end
