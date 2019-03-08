class ExamQuestionShuffler
  def self.call
    new.call
  end

  def call
    ExamQuestion.unassigned.shuffle.pop(5)
  end
end
