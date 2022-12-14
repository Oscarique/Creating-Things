class CasesController < ApplicationController
  def index
    @cases = Case.all
    @user_cases = current_user.cases
  end

  def show
    @case = Case.find(params[:id])
  end

  def new
    @case = Case.new
  end

  def create
    @case = Case.new
    @case.save
    redirect_to user_cases_path(current_user)
  end

  def edit
    @case = Case.find(params[:id])
  end

  def update
    @case = Case.find(params[:id])
    @case.update(params[:case])
  end

  private

  def case_params
    params.require(:case).permit(:title, :description, :user_id)
  end
end
