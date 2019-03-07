class ShuffleQuestionsService
  def self.call(type)
    new(type).call
  end

  def initialize(type)
    @type = type
  end
  attr_reader :type

  def call
    question_type.
  end

  private

  def question_class
    type + '_question'
  end
end
