class CreatePreparationTestService
  def self.call(params: params)
    new(params).call
  end

  def initialize(params)
    @params = params
  end

  attr_reader :params

  def call
    preparation_test = ActiveRecord::Base.transaction do
      preparation_test = PreparationTest.create(params)
      AddQuestionsToTestService.call(preparation_test) if preparation_test.errors.blank?
    end
    preparation_test
  end
end
