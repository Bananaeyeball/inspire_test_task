class PreparationQuestionsController < ApplicationController
  before_action :set_preparation_question, only: [:show, :edit, :update, :destroy]

  # GET /preparation_questions
  # GET /preparation_questions.json
  def index
    @preparation_questions = PreparationQuestion.all
  end

  # GET /preparation_questions/1
  # GET /preparation_questions/1.json
  def show
  end

  # GET /preparation_questions/new
  def new
    @preparation_question = PreparationQuestion.new
  end

  # GET /preparation_questions/1/edit
  def edit
  end

  # POST /preparation_questions
  # POST /preparation_questions.json
  def create
    @preparation_question = PreparationQuestion.new(preparation_question_params)

    respond_to do |format|
      if preparation_question.save
        format.html { redirect_to preparation_question, notice: 'Preparation question was successfully created.' }
        format.json { render :show, status: :created, location: preparation_question }
      else
        format.html { render :new }
        format.json { render json: preparation_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preparation_questions/1
  # PATCH/PUT /preparation_questions/1.json
  def update
    respond_to do |format|
      if preparation_question.update(preparation_question_params)
        format.html { redirect_to preparation_question, notice: 'Preparation question was successfully updated.' }
        format.json { render :show, status: :ok, location: preparation_question }
      else
        format.html { render :edit }
        format.json { render json: preparation_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preparation_questions/1
  # DELETE /preparation_questions/1.json
  def destroy
    preparation_question.destroy
    respond_to do |format|
      format.html { redirect_to preparation_questions_url, notice: 'Preparation question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def preparation_question
      @preparation_question ||= PreparationQuestion.find(params[:id])
    end
    helper_method :preparation_question

    # Never trust parameters from the scary internet, only allow the white list through.
    def preparation_question_params
      params.require(:preparation_question).permit(:title, :body, :hint)
    end
end
