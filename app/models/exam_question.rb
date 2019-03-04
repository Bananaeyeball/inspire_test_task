class ExamQuestion < ApplicationRecord
  belongs_to :exam, required: false

  validates :title, :body, presence: true
end
