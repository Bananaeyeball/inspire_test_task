class AddQuestionsToTestService
  QuestionTypes = [exam: 'exam', preparation_test:' preparation'}.freeze

  def self.call(test)
    new(test).call
  end

  def initialize(test)
    @test = test
  end

  def call
    question_type = QuestionTypes.fetch(test.class.to_s.underscore.to_sym, '')
    ShuffleQuestionsService.call(question_type)
  end
end
