class QuestionPresenter

  def self.call(question)
    new(question).call
  end

  def initialize(question)
    @question = question
  end

  attr_reader :question

  delegate_missing_to :question

  def type
    question.class.to_s.underscore
  end
end
