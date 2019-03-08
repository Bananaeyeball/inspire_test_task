class QuestionsController < ApplicationController
  def index
    @questions = QuestionsPresenter.call(exam_questions, preparation_questions)
  end

  private

  def exam_questions
    ExamQuestion.all
  end

  def preparation_questions
    PreparationQuestion.all
  end
end
