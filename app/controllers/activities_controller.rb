class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end
  def new
    @activity = Activity.new

  end
  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activities_path
    else
      rendet :new
    end
  end
  def show
    @activity = Activity.find(params[:id])

  end
  def edit
    @activity = Activity.find(params[:id])
  end
  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to activities_path
    else
      render :edit
    end
  end
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path
  end
  private
  def activity_params
    params.require(:activity).permit(:title, :body)

  end
end
