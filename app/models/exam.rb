class Exam < ApplicationRecord
  REQUIRED_QUESTION_COUNT = 5.freeze

  has_many :questions, class_name: 'ExamQuestion', dependent: :nullify

  validates :name, presence: true, uniqueness: true
  validate :question_presence

  private

  def question_presence
    return if ExamQuestion.unassigned.count >= REQUIRED_QUESTION_COUNT
    errors.add(:base, :questions_should_be_present, { count: count_questions_to_create })
  end

  def count_questions_to_create
    REQUIRED_QUESTION_COUNT - ExamQuestion.unassigned.count
  end
end
