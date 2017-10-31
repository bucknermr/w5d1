class Goal < ApplicationRecord
  validates :objective, presence: true
  validates_inclusion_of :completed, :shared, in: [true, false]

  belongs_to :user

end
