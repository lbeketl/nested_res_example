class SchoolsController < ApplicationController
  before_action :set_school, only: %i[ show edit update destroy ]
  before_action :get_city
  # GET /schools or /schools.json
  def index
    @schools = @city.schools
  end

  # GET /schools/1 or /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school = @city.schools.build
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools or /schools.json
  def create
    @school = @city.schools.build(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to city_schools_path(@city), notice: "School was successfully created." }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1 or /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to city_school_path(@city), notice: "School was successfully updated." }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1 or /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to city_schools_path(@city), notice: "School was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = @city.schools.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def school_params
      params.require(:school).permit(:name, :city_id)
    end

    def get_city
      @city = City.find(params[:city_id])
    end

end
