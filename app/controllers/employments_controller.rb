class EmploymentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  def index
    @employments = Employment.all
  end
  def new
    @employment = Employment.new
  end
  def create
    @employment = Employment.new(employment_params)
    if @employment.save
      redirect_to employments_path
    else
      render :new
    end
  end
  def edit
    @employment = Employment.find(params[:id])

  end
  def update
    @employment = Employment.find(params[:id])
    if
      @employment.update(employment_params)
      redirect_to employments_path
    else
      render :edit
    end
  end
  def destroy
    @employment = Employment.find(params[:id])

    @employment.destroy
    redirect_to employments_path
  end
  private
  def employment_params
    params.require(:employment).permit(:title,  :body)
  end
end
