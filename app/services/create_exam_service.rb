class CreateExamService
  def self.call(params: params)
    new(params).call
  end

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    exam = Exam.create(params)
    AddQuestionsToTestService.call(exam) if exam.errors.blank?
    exam
  end
end
