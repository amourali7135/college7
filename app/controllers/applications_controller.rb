class ApplicationsController < ApplicationController
    before_action :set_program, only: %i[show edit update destroy new create]
  # before action :set_application, only: %i[show edit update destroy]
  # before action :set_application, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
      @program = Program.find(params[:program_id])
      @applications = Application.where(program_id: @program.id).includes([:program]).includes([:user])

    end


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
      flash[:notice] = "You've successfully submitted your application, good luck!"
      redirect_to user_dashboard_path
    else
      flash[:notice] = "There was an error, please try again!"
      render 'new'
      # render new_program_application_path(@program, @application)
      # raise
    end
  end

  def edit
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    # Different redirects for employer and student redirects!
    if @application.update(application_params) && current_user.student?
      flash[:notice] = "You've successfully updated your application"
      redirect_to user_dashboard_path
    elsif @application.update(application_params) && current_user.id = @application.program.user_id
      flash[:notice] = "You've successfully updated this application.  The applicant will be informed shortly"
      redirect_to program_application_path(@application.program_id, @application)
    else
      flash[:error] = 'There was an error, please try again!'
      render 'edit'
    end
    # raise
  end

  def show
    @application = Application.find(params[:id]).includes([:program])
    # raise
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    flash[:notice] = 'Your application was successfully deleted!'
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
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
