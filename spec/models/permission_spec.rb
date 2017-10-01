require 'rails_helper'

RSpec.describe Permission, type: :model do
  # Association test
  it { should have_many(:roles).dependent(:destroy) }

  # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end