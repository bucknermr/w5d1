class Goal < ApplicationRecord
  validates :objective, :completed, :shared, presence: true

  belongs_to :user

end
