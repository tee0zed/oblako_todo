class TodosController < ApplicationController
  before_action :set_todo, only: :update
  before_action :set_project, only: :create

  def create
    @new_todo = @project.todos.build(todo_params)

    if @new_todo.save
      render json: @new_todo
    else
      render json: { error: @new_todo.errors }, status: 422
    end
  end

  def update
    if @todo.toggle!(:checked)
      render json: @todo
    else
      render json: { error: @todo.errors }, status: 422
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def todo_params
    params.require(:todo).permit(:todoname)
  end
end
