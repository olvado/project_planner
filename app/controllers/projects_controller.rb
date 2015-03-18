class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Projects.new
    @project.resources.build
  end

  def edit
    @project = Projects.find(params[:id])
    @project.resources.build
  end

  def create
    @project = Project.new(permitted_params)
  end

private

  def permitted_params

  end

end
