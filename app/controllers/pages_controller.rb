class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :help, :contact, :team, :blog, :career, :businesses, :registration ]

  def home
  end

  def about
  end

  def help
  end

  def contact
  end

  def business_dashboard
    if !current_user.employer?
      flash[:notice] = "Only employers can access a business dashboard"
      redirect_to root_path
    end
    @programs = Program.where(user_id: current_user.id)
    @applications = Application.where(program_id: params[:program_id])
    # @applications = Application.where(application.program.user_id = current_user.id)
    # @program = Program.where(program_id: params[:program_id])
    # @program = Program.find_by_id(params[:id])
  end
  
  def user_dashboard
  @applications = Application.where(user_id: current_user.id)#.includes([:user])#.includes([:program])
  # @pagy, @programs = pagy(current_user.find_liked_items, items: 20)
  # Need to filter/scope out applied to from the saved!  Not key though, figure it out for later.  
  # @programs = current_user.applications.where(program_id: current_user.find_liked_items)
  @programs = current_user.find_liked_items#.where(application.program_id: program.id)
    if !current_user || current_user.employer?
      flash[:notice] = "Only student users can access a user dashboard"
      redirect_to root_path
    end
    respond_to do |format|
      format.html
      format.js
    end
    # raise
  end

  def team
  end

  def blog
  end

  def career
  end

  def businesses
    @users = User.where(emplopyer: true)
  end
end
