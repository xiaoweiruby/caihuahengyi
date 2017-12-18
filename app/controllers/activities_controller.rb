class ActivitiesController < ApplicationController
  def index

  end
  def new
    @activity = Activity.new

  end
  def create
    @activity = Activity.new(activity_params)
    redirect_to activities_path
    

  end
  private
  def activity_params
    params.require(:activity).permit(:title, :body)

  end
end
