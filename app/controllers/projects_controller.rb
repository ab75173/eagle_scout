class ProjectsController < ApplicationController

  def index
    @projects = Project.where(user_id: params["user_id"])
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @project = Project.new
  end

  def create
    Project.create(name: params[:name], description: params[:description], council: params[:council], troop: params[:troop], date: params[:date], latitude: params[:latitude], longitude: params[:longitude])
    redirect_to("/users/#{params[:user_id]}/projects")
  end



end
