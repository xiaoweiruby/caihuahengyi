class QasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  def index
    @qas = Qa.all
  end
  def new
    @qa = Qa.new
  end
  def create
    @qa = Qa.new(qa_params)
    if @qa.save
      redirect_to qas_path
    else
      render :new
    end
  end
  def show
    @qa = Qa.find(params[:id])
  end
  def edit
    @qa = Qa.find(params[:id])

  end
  def update
    @qa = Qa.find(params[:id])
    if @qa.update(qa_params)
      redirect_to qas_path
    else
      render :edit

    end

  end
  def destroy
    @qa = Qa.find(params[:id])

    @qa.destroy
    redirect_to qas_path

  end

  private
  def qa_params
    params.require(:qa).permit(:title, :body)
  end
end
