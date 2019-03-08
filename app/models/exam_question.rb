class ExamQuestion < ApplicationRecord
  belongs_to :exam, required: false

  validates :title, :body, presence: true, uniqueness: true

  after_create :reshuffle_all_tests

  scope :unassigned, -> { where(exam_id: nil) }

  def reshuffle_all_tests
    require 'pry'; binding.pry
    Exam.all.each do |exam|
      exam.questions.clear
      AddQuestionsToTestService.call(exam)
    end
  end
end
