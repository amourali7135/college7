class DueDateStatusJob < ApplicationJob
  queue_as :default

  def perform(program)
    if program.application_due_date < Date.today == true
    program.status = "permanently_closed"
    program.save
    end
    puts "hello world!"
  end
end
