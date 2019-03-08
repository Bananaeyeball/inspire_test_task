class ExamQuestion < ApplicationRecord
  belongs_to :exam, required: false

  validates :title, :body, presence: true, uniqueness: true

  before_save :reshuffle_all_tests

  scope :unassigned, -> { where(exam_id: nil) }

  def reshuffle_all_tests
    Exam.all.each do |exam|
      exam.questions.clear
      AddQuestionsToTestService.call(exam)
    end
  end
end
