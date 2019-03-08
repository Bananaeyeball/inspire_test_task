class AddQuestionsToTestService
  QuestionTypes = { exam: 'exam', preparation_test: 'preparation' }.freeze

  def self.call(test)
    new(test).call
  end

  def initialize(test)
    @test = test
  end

  def call
    question_type = QuestionTypes.fetch(test.class.to_s.underscore.to_sym, '')
    @test.questions << questions_for_test(question_type)
    @test.questions.each { |q| q.add_use_count }
    @test
  end

  private

  def questions_for_test(type)
    ShuffleQuestionsService.call(type)
  end
end
