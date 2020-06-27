class ProjectsController < ApplicationController
  before_action :set_project, only: :show

  def index
    render json: Project.with_todos.to_json
  end

  def show
    render json: @project.todos.all
  end

  def create
    @new_project = Project.build(project_params)

    if @project.save
      render json: @project
    else
      render json: { error: @project.errors }, status: 422
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:projectname)
  end
end