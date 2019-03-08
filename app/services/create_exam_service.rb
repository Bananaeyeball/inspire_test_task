class CreateExamService
  def self.call(params: params)
    new(params).call
  end

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    exam = ActiveRecord::Base.transaction do
      exam = Exam.create(params)
      AddQuestionsToTestService.call(exam)
    end
    exam
  end
end
