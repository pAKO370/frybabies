class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      flash[:notice] = "Image was saved"
      redirect_to images_path
    else
      flash[:alert] = "Image not saved"
      redirect_to images_path
    end
  end

  def destroy
    @image = Image.find(params[:id])

    if @image.destroy
      flash[:notice] = "Image was deleted"
      redirect_to images_path
    else
      flash[:alert] = "Image was not deleted"
      redirect_to images_path
    end
  end

  private
  
  def image_params
    params.require(:image).permit(:image)
  end

end
