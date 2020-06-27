class Project < ApplicationRecord
  has_many :todos, dependent: :destroy

  validates :projectname, presence: true

  scope :with_todos, -> { Project.includes(:todos).where.not(todos: {id: nil}) }
end
