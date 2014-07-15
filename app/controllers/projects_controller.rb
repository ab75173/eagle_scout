class ProjectsController < ApplicationController
  before_action(:load_user, only: [:new, :create] )
  before_action(:load_project, { only: [:edit, :update, :destroy] })

  def index
    @projects = Project.where(user_id: params["user_id"])
  end

  def devote
    render json: Project.all
  end

  def show
    @user = User.find(params[:user_id])
    @project = Project.find(params[:id])
  end

  def map
    @user = User.find_by(params[:id])
    @projects = Project.all
  end

  def new
    @user = User.find(params[:user_id])
    @project = Project.new
  end

  def create
    Project.create(name: params[:project][:name], description: params[:project][:description], user_id: params[:user_id], council: params[:project][:council], troop: params[:project][:troop], date: params[:project][:date], latitude: params[:project][:latitude], longitude: params[:project][:longitude])
    redirect_to("/users/#{params[:user_id]}/projects")
  end

  def edit
    @user = User.find(params[:user_id])
    @project = Project.find(params[:id])
  end

  def update
    Project.find(params[:id]).update(project_params)
    redirect_to user_path(@project.user)
  end

  def destroy
    @project.destroy
    redirect_to user_path(@project.user)
  end

  private

  def load_user
    return @user = User.find_by(id: params[:user_id])
  end

  def load_project
    return @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :user_id, :council, :troop, :date, :latitude, :longitude)
  end



end
