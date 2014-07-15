class WelcomeController < ApplicationController

  def index
    @user = User.find(params[:id])
    @project = Project.find(params[:id])
  end

end
