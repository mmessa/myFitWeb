class SupplementsController < ApplicationController
  before_action :set_supplement, only: [:show, :edit, :update, :destroy]

  # GET /supplements
  # GET /supplements.json
  def index
    @supplements = Supplement.all
  end

  # GET /supplements/1
  # GET /supplements/1.json
  def show
  end

  # GET /supplements/new
  def new
    @profile = Profile.find params[:profile_id]
    @supplement = @profile.supplements.new
  end

  # GET /supplements/1/edit
  def edit
  end

  # POST /supplements
  # POST /supplements.json
  def create
    @profile = Profile.find params[:profile_id]
    @supplement = @profile.supplements.new(supplement_params)

    respond_to do |format|
      if @supplement.save
        format.html { redirect_to profile_url(@profile), notice: 'Supplement was successfully created.' }
        format.json { render :show, status: :created, location: @supplement }
      else
        format.html { render :new }
        format.json { render json: @supplement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplements/1
  # PATCH/PUT /supplements/1.json
  def update
    respond_to do |format|
      if @supplement.update(supplement_params)
        format.html { redirect_to profile_url(@supplement.profile), notice: 'Supplement was successfully updated.' }
        format.json { render :show, status: :ok, location: @supplement }
      else
        format.html { render :edit }
        format.json { render json: @supplement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplements/1
  # DELETE /supplements/1.json
  def destroy
    @supplement.destroy
    respond_to do |format|
      format.html { redirect_to profile_url(@supplement.profile), notice: 'Supplement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplement
      @supplement = Supplement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplement_params
      params.require(:supplement).permit(:name, :profile_id)
    end
end
