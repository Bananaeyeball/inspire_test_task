class CreateExamService
  def self.call(params: params)
    new(params).call
  end

  def initialize(params)
    @params = params
    @errors = []
  end

  def call
    exam = Exam.create(params)
    AddQuestionsToTestService.call(exam)
  end

  def create
    max_exam_tests = ExamQuestion.count / EXAM::QUESTION_COUNT
    if max_exam_tests < 1
      @errors << 'Create more questions'
    end

    if Exam.count == 0
      @errors << 'Add exam'
    end
  end

  def question_all_shuffler
    ExamQuestions.where(exam_id: nil).shuffle.pop(5)
  end
end
