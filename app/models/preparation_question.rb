class PreparationQuestion < ApplicationRecord
  has_and_belongs_to_many :preparation_tests

  validates :title, :body, presence: true, uniqueness: true

  after_create :reshuffle_all_tests

  def add_use_count
    update(use_count: use_count + 1)
  end

  private

  def reshuffle_all_tests
    PreparationTest.all.each do |test|
      test.questions.clear
      AddQuestionsToTestService.call(test)
    end
  end
end
