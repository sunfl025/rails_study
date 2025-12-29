class Task < ApplicationRecord
  
  validates :name, presence: true
  validates :description, presence: true

  before_save :normalize_name
  after_create :log_created_task
  belongs_to :project
  

  private

  def normalize_name
    self.name = name.strip.capitalize
  end
  def log_created_task
    Rails.logger.info "Task #{id} created successfully"
  end
end
