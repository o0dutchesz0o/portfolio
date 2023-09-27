class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: "#{@project.title} was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

def edit
end

def update
  respond_to do |format|
    if @project.update(project_params)
      format.html { redirect_to projects_path, notice: "#{@project.title} was successfully updated." }
      format.json { render :show, status: :ok, location: @project }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @project.errors, status: :unprocessable_entity }
    end
  end
end

private
  def set_project
    @project = Project.find(params[:id])
  end
  def project_params
    params.require(:project).permit(:title, :subtitle, :body, :main_image, :thumb_image)
  end

end