class ProjectsController < ApplicationController
  before_action :set_project, only: :show

  def index
    render json: Project.with_todos
  end

  def show
    render json: @project.todos
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end