class Exam < ApplicationRecord
  has_many :exam_questions, dependent: :nullify

  validates :name, presence: true
  QUESTION_COUNT = 5.freeze
end
