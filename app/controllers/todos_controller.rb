class TodosController < ApplicationController
  before_action :set_todo, only: :update
  before_action :set_or_create_project, only: :create

  def create
    unless todo_params.present?
      render json: @project, status: :ok, location: project_path(@project)
      return
    end

    @new_todo = @project.todos.build(todo_params)

    if @new_todo.save
      render json: @new_todo, status: :created, location: todos_path(@new_todo)
    else
      render json: @new_todo.errors, status: :unprocessable_entity
    end
  end

  def update
    if @todo.toggle!(:checked)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def set_or_create_project
    @project =
      # если имеем только имя проекта, создастся новый проект с таким именем, или будет взят существующий
      if project_params[:projectname]
        Project.find_or_initialize_by(projectname: project_params[:projectname])
      # если имеет только айди проекта, возьмем из базы по айди
      elsif project_params[:id]
        Project.find_by(id: project_params[:id])
      end
    # если имеем и айди и имя проекта, в случае если имя отличается от имени проекта которому принадлежит передаваемый айди,
    # имя будет обновлено, если нет - обьект будет вытащен из базы. Преимущество айди.
    if project_params[:projectname] && project_params[:id]
      update_project_name
    end
    # если @project = nil значит не был передан ни айди, ни имя, выгрузим ошибку.
    if @project.present? && @project.save
      @project
    else
      @project.errors.add(:id, @error_str) unless @project.nil?
      render json: @project.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update_project_name
    @project =
      Project.where(id: project_params[:id])
      .first_or_initialize

    @project.projectname = project_params[:projectname]
  end

  def todo_params
    params.fetch(:todo, {}).permit(:todoname)
  end

  def project_params
    params.fetch(:project, {}).permit(:projectname, :id)
  end
end
