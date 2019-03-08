class ExamQuestionsController < ApplicationController
  # GET /exam_questions/1
  # GET /exam_questions/1.json
  def show
  end

  # GET /exam_questions/new
  def new
    @exam_question = ExamQuestion.new
  end

  # GET /exam_questions/1/edit
  def edit
  end

  # POST /exam_questions
  # POST /exam_questions.json
  def create
    @exam_question = ExamQuestion.new(exam_question_params)

    respond_to do |format|
      if exam_question.save
        format.html { redirect_to questions_path, notice: 'Exam question was successfully created.' }
        format.json { render :show, status: :created, location: exam_question }
      else
        format.html { render :new }
        format.json { render json: exam_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_questions/1
  # PATCH/PUT /exam_questions/1.json
  def update
    respond_to do |format|
      if exam_question.update(exam_question_params)
        format.html { redirect_to exam_question, notice: 'Exam question was successfully updated.' }
        format.json { render :show, status: :ok, location: exam_question }
      else
        format.html { render :edit }
        format.json { render json: exam_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_questions/1
  # DELETE /exam_questions/1.json
  def destroy
    exam_question.destroy
    respond_to do |format|
      format.html { redirect_to questions_path, notice: 'Exam question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def exam_question
      @exam_question ||= ExamQuestion.find(params[:id])
    end
    helper_method :exam_question

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_question_params
      params.require(:exam_question).permit(:title, :body, :explanation)
    end
end
