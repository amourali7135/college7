class ApplicationsController < ApplicationController
    before_action :set_program, only: %i[show edit update destroy new create]
  # before action :set_application, only: %i[show edit update destroy]
  # before action :set_application, only: [:show, :edit, :update, :destroy]
        skip_before_action :authenticate_user!, only: [:index, :show]


  def new
    @program = Program.find(params[:program_id])
    @application = Application.new
  end
  
  def create
    @program = Program.find(params[:program_id])
    @application = Application.new(application_params)
    @application.essay_question_one = @program.essay_question_one #if @program.essay_one_needed
    @application.essay_question_two = @program.essay_question_two# if @program.essay_two_needed
    @application.essay_question_three = @program.essay_question_three# if @program.essay_three_needed
    @application.user_id = current_user.id
    @application.program = @program
    if @application.save
      flash[:notice] = "You've successfully submitted your application!"
      redirect_to @program
    else
      flash[:notice] = "There was an error, please try again!"
      render 'new'
      # render new_program_application_path(@program, @application)
      raise
    end
  end

  def edit
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    if @application.update(application_params)
      flash[:notice] = "You've successfully updated your application"
      redirect_to user_dashboard_path
    else
      flash[:error] = 'There was an error, please try again!'
      render 'edit'
    end
  end

  def show
    @application = Application.find(params[:id])
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    flash[:notice] = 'Your application was successfully deleted!'
    redirect_to @application.program
  end

  private

  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_application
    @application = Application.find(params[:id])
  end

  def application_params
    params
      .require(:application)
      .permit(
        :essay_question_one,
        :first_essay,
        :essay_question_two,
        :second_essay,
        :essay_question_three,
        :third_essay,
        :status,
        :program_id,
        :user_id, 
      )
  end
end
