class Todo < ApplicationRecord
  belongs_to :project

  validates :todoname, :project, presence: true

  validate :ensure_not_checked, on: :create

  private

  def ensure_not_checked
    errors.add(:todo, "can't be already completed!") if checked?
  end
end
