class HomeController < ApplicationController
  def index
    @tests = TestsPresenter.call(exams, preparation_tests)
  end

  private

  def exams
    Exam.all
  end

  def preparation_tests
    PreparationTest.all
  end
end
