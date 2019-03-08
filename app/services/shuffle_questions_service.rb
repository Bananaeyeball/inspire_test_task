class ShuffleQuestionsService
  def self.call(type)
    new(type).call
  end

  def initialize(type)
    @type = type
  end

  attr_reader :type

  def call
    question_shuffler_class.call
  end

  private

  def question_shuffler_class
    (type + '_question_shuffler').camelize.constantize
  end
end
