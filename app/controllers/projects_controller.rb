class ProjectsController < ApplicationController

  def index
    @projects = Project.all.map(&:decorate)
    @weeks = []
    53.times do |w|
      date = Date.commercial(Date.today.cwyear, w+1, 1)
      hash = {
        number: w+1,
        date: date,
        fee: fee(w+1, @projects, date)
      }
      @weeks << OpenStruct.new(hash)
    end
  end

  def show
  end

  def new
    @project = Project.new
    @project.resources.build
  end

  def create
    @project = Project.new(permitted_params)
    if @project.save
      redirect_to root_url, notice: "Project added."
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    @project.resources.build
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(permitted_params)
      redirect_to root_url, notice: "Project updated."
    else
      render :edit
    end
  end


private

  def permitted_params
    params.require(:project).permit(
        :name, :description, :fee, :start_at, :color, :weeks,
        resources_attributes: [
          :id, :name, :allocation, :fee
        ]
      )
  end

  def fee(w, projects, date)
    the_fee = 0.0
    projects.each do |p|
      the_fee += (p.fee / p.weeks) if (p.start_at..p.end_at).cover?(date.to_time)
    end
    the_fee
  end

end
