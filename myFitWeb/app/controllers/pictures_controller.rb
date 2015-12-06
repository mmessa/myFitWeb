class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @update = Update.find params[:update_id]
    @picture = @update.pictures.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @update = Update.find params[:update_id]
    @picture = @update.pictures.new(picture_params)
    @picture.generate_filename  # a function you write to generate a random filename and put it in the images "filename" variable

    @uploaded_io = params[:picture][:uploaded_file]

    File.open(Rails.root.join('public', 'images', @picture.name), 'wb') do |file|
        file.write(@uploaded_io.read)
    end

    if @picture.save
      redirect_to update_path(@update), notice: 'Image was successfully created.'
    else
      render :new
    end
  end

    #respond_to do |format|
    #  if @picture.save
    #    format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
    #    format.json { render :show, status: :created, location: @picture }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @picture.errors, status: :unprocessable_entity }
    #  end
    #end
  #end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:name, :profile_id)
    end
end
