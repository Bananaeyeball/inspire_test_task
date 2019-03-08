class PreparationQuestionShuffler
  def call
    new.call
  end

  def call
    lower_count_questions = []
    (min_use_count..max_use_count).each do |count|
      if lower_count_questions.count >= 5
        return lower_count_questions.reverse.pop(5)
      elsif (grouped_question_hash[count] + lower_count_questions).count < 5
        lower_count_questions += grouped_question_hash[count]
        next
      else
        return (grouped_question_hash[count] + lower_count_questions).reverse.pop(5)
      end
    end
  end

  def grouped_question_hash
    @grouped_hash ||= PreparationQuestion.all.group_by(&:use_count)
  end

  def min_use_count
    PreparationQuestion.minimum(:use_count)
  end

  def max_use_count
    PreparationQuestion.maximum(:use_count)
  end
end
