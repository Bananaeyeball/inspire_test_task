class AddQuestionsToTestService
  QuestionTypes = { exam: 'exam', preparation_test: 'preparation' }.freeze

  def self.call(test)
    new(test).call
  end

  def initialize(test)
    @test = test
  end

  attr_reader :test

  def call
    question_type = QuestionTypes.fetch(test.class.to_s.underscore.to_sym, '')
    test.questions << questions_for_test(question_type)
    increase_counter_for_preparation_questions if test.class.to_s == 'PreparationTest'
    test
  end

  private

  def increase_counter_for_preparation_questions
    test.questions.each { |q| q.add_use_count }
  end

  def questions_for_test(type)
    ShuffleQuestionsService.call(type)
  end
end
