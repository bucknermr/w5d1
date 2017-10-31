require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should validate_presence_of(:objective) }
  it { should validate_inclusion_of(:completed).in_array([true, false]) }
  it { should validate_inclusion_of(:shared).in_array([true, false]) }

  describe 'Associations' do
    it { should belong_to(:user) }
  end

end
