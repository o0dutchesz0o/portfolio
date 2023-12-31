class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  layout "project"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @projects = Project.includes(:technologies)
  end

  def show
  end

  def new
    @project = Project.new
    3.times { @project.technologies.build }
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

  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

private
  def set_project
    @project = Project.find(params[:id])
  end
  def project_params
    params.require(:project).permit(:title, :subtitle, :body, :main_image, :thumb_image, technologies_attributes: [:name])
  end

end