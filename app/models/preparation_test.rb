class PreparationTest< ApplicationRecord
  REQUIRED_QUESTION_COUNT = 5.freeze

  has_and_belongs_to_many :questions, class_name: 'PreparationQuestion'

  validates :name, presence: true, uniqueness: true
  validate :question_presence

  before_destroy :decrease_counter_on_questions_and_clear

  private

  def decrease_counter_on_questions_and_clear
    questions.each { |question| question.update(use_count: question.use_count - 1) }
    questions.clear
  end

  def question_presence
    return if PreparationQuestion.count >= REQUIRED_QUESTION_COUNT
    errors.add(:base, :questions_should_be_present, { count: count_questions_to_create })
  end

  def count_questions_to_create
    REQUIRED_QUESTION_COUNT - PreparationQuestion.count
  end
end
