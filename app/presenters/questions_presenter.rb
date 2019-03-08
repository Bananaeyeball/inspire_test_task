class QuestionsPresenter
  def self.call(exam_questions, preparation_questions)
    new(exam_questions, preparation_questions).call
  end

  attr_reader :exam_questions, :preparation_questions

  def initialize(exam_questions, preparation_questions)
    @exam_questions = exam_questions
    @preparation_questions = preparation_questions
  end

  def call
    (exam_questions + preparation_questions).map do |question|
      QuestionPresenter.new(question)
    end
  end
end
