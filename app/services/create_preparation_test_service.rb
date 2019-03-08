class CreatePreparationTestService
  def self.call(params: params)
    new(params).call
  end

  def initialize(params)
    @params = params
  end

  def call
    preparation_test = PreparationTest.create(params)
    AddQuestionsToTestService.call(preparation_test) if preparation_test.errors.blank?
  end
end
