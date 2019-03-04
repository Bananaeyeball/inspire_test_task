json.extract! exam_question, :id, :title, :body, :explanation, :exam_id, :created_at, :updated_at
json.url exam_question_url(exam_question, format: :json)
