require 'rails_helper'

RSpec.describe Role, type: :model do
  # Association test
  it { should have_many(:users).dependent(:destroy) }
  it { should have_and_belong_to_many(:permissions) }

  # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end