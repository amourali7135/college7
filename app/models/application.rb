class Application < ApplicationRecord
  belongs_to :program, counter_cache: :applications_count
  belongs_to :user

  enum status: { pending: 0, interested: 1, rejected: 2, accepted: 3 }, _default: "pending"

  validates :first_essay, length: {minimum: 50, maximum: 1500}, presence: true, if: :essay_one?
  validates :second_essay, length: {minimum: 50, maximum: 1500}, presence: true, if: :essay_two?
  validates :third_essay, length: {minimum: 50, maximum: 1500}, presence: true, if: :essay_three?

  #call back psuedo code:  If application.status is changed from pending, mail the user and notify them too.
  

  def essay_one?
    return true if self.program.essay_one_needed
  end

  def essay_two?
    return true if self.program.essay_two_needed
  end

  def essay_three?
    return true if self.program.essay_three_needed 
  end
end
