class ProgramsController < ApplicationController
    before_action :set_program, only: %i[show edit update destroy like unlike]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    # params["search"].values !!!
    # multiple values on art project was concacetannating arrays, but one is a string...so concat won't work!  FUCK!
    if params["search"].present? && params["search"]["location"].present?
      @filter = [params[:search][:location], params[:search][:remote], params[:search][:length], params[:search][:program_format], params[:search][:occupation_tagging_list], params[:search][:time_requirement]].reject(&:blank?)
      
      @pagy, @programs = pagy(Program.global_search(@filter).where(status: :active).includes([:user]).near(params["search"]["location"]), items: 20)
    elsif params["search"].present? 
      @filter = [params[:search][:location], params[:search][:remote], params[:search][:length], params[:search][:program_format], params[:search][:occupation_tagging_list], params[:search][:time_requirement]].reject(&:blank?)

      @pagy, @programs = pagy(Program.global_search(@filter).where(status: :active).includes([:user]), items: 20)
    else
      @pagy, @programs = pagy(Program.where(status: :active).includes([:user]), items: 20)
    end
    respond_to do |format|
      format.html
      format.js #{ render layout: false }
    end
    @programs_size = Program.where(status: :active)
    # raise
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    @program.user_id = current_user.id
    if @program.save
      DueDateJob.set(wait_until: @program.application_due_date + 1).perform_later(@program)
      flash[:notice] = 'Your program was successfully created!'
      redirect_to business_dashboard_path
    else
      flash[:error] = 'There was an error, please try again!'
      render 'new'
    end
    # raise
  end

  def show
    respond_to do |format|
      format.html { render 'programs/show' }
      format.js { render layout: false } # Add this line to you respond_to block
    end
    # raise
  end

  def update
    if @program.update(program_params)
      flash[:notice] = "You've successfully updated your program!"
      redirect_to business_dashboard_path
    else
      flash[:error] = 'There was an error, please try again!'
      render 'edit'
    end
  end

  def destroy
    @program.destroy
    flash[:notice] = 'This program was successfully deleted!'
    redirect_to business_dashboard_path
  end

  def edit
   
  end

  def like
    @program.liked_by current_user
    flash[:notice] = "You've successfully liked this program, find it in your dashboard to easily apply to later"
      respond_to do |format|
        format.html { redirect_to @program }
        format.js { render layout: false  }
      end
  end

  def unlike
    @program.unliked_by current_user
    flash[:notice] = "You've successfully unliked this program"
    respond_to do |format|
      format.html { redirect_to @program }
      format.js { render layout: false }
    end
  end

  private

  def set_program
    @program = Program.find(params[:id])
  end

  def program_params
    params
      .require(:program)
      .permit(
        :title,
        :headline,
        :description,
        :rolling,
        :application_due_date,
        :location,
        :remote,
        :spots,
        :requirements,
        :length,
        :minimum_age,
        :visa_sponsorship,
        :start_date,
        :virtual_components,
        :housing_provided,
        :essay_question_one,
        :essay_question_two,
        :essay_question_three,
        :salary,
        :salary_paid,
        :cost,
        :certificate_awarded,
        :nationals_only,
        :time_requirement,
        :job_guaranteed,
        :relocation_assistance,
        :essay_one_needed,
        :essay_two_needed,
        :essay_three_needed,
        :status,
        :program_format,
        :occupation_tagging_list,
        :search
      )
  end
end
