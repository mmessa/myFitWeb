class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  # GET /workouts
  # GET /workouts.json
  def index
    @profile = Profile.find params[:profile_id]
    @workouts = Workouts.all
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
    @workout = Workout.find params[:id]
    @profile = @workout.profile
  end

  # GET /workouts/new
  def new
    @profile = Profile.find params[:profile_id]
    @workout = @profile.workouts.new
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @profile = Profile.find params[:profile_id]
    @workout = @profile.workouts.new(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to profile_updates_path(@profile), notice: 'Workout was successfully created.' }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to profile_updates_path(@workout.profile), notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to profile_updates_path(@workout.profile), notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit(:name, :description, :profile_id)
    end
end
