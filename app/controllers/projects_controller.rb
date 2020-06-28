class ProjectsController < ApplicationController
  before_action :set_project, only: :show

  def index
    render json: Project.with_todos.to_json
  end

  def show
    render json: @project.todos.all
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end