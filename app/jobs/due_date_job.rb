class DueDateJob < ApplicationJob
  queue_as :default

  def perform(program)
    # Do something later
    program.status = "permanently_closed"
    program.save
  end
end
