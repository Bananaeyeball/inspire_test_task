class TestsPresenter
  def self.call(exams, preparation_tests)
    new(exams, preparation_tests).call
  end

  attr_reader :exams, :preparation_tests

  def initialize(exams, preparation_tests)
    @exams = exams
    @preparation_tests = preparation_tests
  end

  def call
    (exams + preparation_tests).map do |test|
      TestPresenter.new(test)
    end
  end
end
