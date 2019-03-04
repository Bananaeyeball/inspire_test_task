class TestPresenter

  def self.call(test)
    new(test).call
  end

  def initialize(test)
    @test = test
  end

  attr_reader :test

  delegate_missing_to :test

  def type
    test.class.to_s.underscore
  end
end
