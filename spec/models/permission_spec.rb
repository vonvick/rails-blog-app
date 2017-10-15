require 'rails_helper'

RSpec.describe Permission, type: :model do
  # Association test
  it { should have_and_belong_to_many(:roles) }

  # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end