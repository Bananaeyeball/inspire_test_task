class PreparationQuestion < ApplicationRecord
  has_and_belongs_to_many :preparation_tests

  validates :title, :body, presence: true
end
