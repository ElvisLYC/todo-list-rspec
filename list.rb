class List
  attr_reader :title, :tasks

  def initialize(title, tasks=[])
    @title = title
    @tasks = tasks
  end

  def add_task(task)
    tasks << task
  end

  def complete_task(index)
    # if index > tasks.length-1
    #   raise_error (Argument)
    # else
    tasks[index].complete!
    # end
  end

  def delete_task(index)
    #tasks.order(:description)
    tasks.delete_at(index)
  end

  def completed_tasks
    tasks.select { |task| task.complete? }
  end

  def incomplete_tasks
    tasks.select { |task| !task.complete? }
  end
end
