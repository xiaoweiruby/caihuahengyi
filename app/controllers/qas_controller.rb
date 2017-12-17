class QasController < ApplicationController
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

  private
  def qa_params
    params.require(:qa).permit(:title, :body)
  end
end
