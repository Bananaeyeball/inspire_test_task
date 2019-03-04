class Exam < ApplicationRecord
  has_many :exam_questions, dependent: :nullify

  validates :name, presence: true
end
