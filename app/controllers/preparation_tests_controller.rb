class PreparationTestsController < ApplicationController
  # GET /preparation_tests/1
  # GET /preparation_tests/1.json
  def show
  end

  # GET /preparation_tests/new
  def new
    @preparation_test = PreparationTest.new
  end

  # GET /preparation_tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @preparation_test = CreatePreparationTestService.call(params: test_params)

    respond_to do |format|
      if preparation_test.errors.empty?
        format.html { redirect_to preparation_test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: preparation_test }
      else
        format.html { render :new }
        format.json { render json: preparation_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preparation_tests/1
  # PATCH/PUT /preparation_tests/1.json
  def update
    respond_to do |format|
      if preparation_test.update(test_params)
        format.html { redirect_to preparation_test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: preparation_test }
      else
        format.html { render :edit }
        format.json { render json: preparation_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    preparation_test.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def preparation_test
      @preparation_test ||= PreparationTest.find(params[:id])
    end
    helper_method :preparation_test

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:preparation_test).permit(:name)
    end
end
