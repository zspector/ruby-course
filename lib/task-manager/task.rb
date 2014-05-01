
class TM::Task
  attr_reader :pid, :description, :tid, :time
  attr_accessor :completed, :priority, :due, :overdue

  @@task_id = 0
  @@tasks = []
  def initialize(pid, description, priority)
    @@tasks << self
    @pid = pid
    @description = description
    @priority = priority
    @@task_id += 1
    @tid = @@task_id
    @completed = false
    @time = Time.now
    @due
    @overdue = false
  end

  def set_complete
    @completed = true
    @overdue = false
  end

  def self.find_task(id)
    @@tasks.select{|task| task.tid == id}
  end

  def due_date(year, month, day)
    @due = Time.new(year, month, day)
    if @due < Time.now && @completed == false
      @overdue = true
    else
      @overdue = false
    end
  end

  def overdue?
    if @due < Time.now && @completed == false
      @overdue = true
      return true
    else
      return false
    end
  end

  # def self.mark_complete(task_id)
  #   task = @@tasks[task_id]
  #   task.complete = true
  #   task.completed_at = Time.now

  #   true
  # end

  def self.reset_class_variables
    @@task_id = 0
  end
end
