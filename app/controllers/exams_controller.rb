class ExamsController < ApplicationController
  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = CreateExamService.call(params: exam_params)

    respond_to do |format|
      if exam.errors.blank?
        format.html { redirect_to exam, notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: exam }
      else
        format.html { render :new }
        format.json { render json: exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if exam.update(exam_params)
        format.html { redirect_to exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: exam }
      else
        format.html { render :edit }
        format.json { render json: exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    exam.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def exam
      @exam ||= Exam.find(params[:id])
    end
    helper_method :exam

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:name)
    end
end
