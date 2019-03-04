class PreparationTest< ApplicationRecord
  has_and_belongs_to_many :preparation_questions

  validates :name, presence: true
end
