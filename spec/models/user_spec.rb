require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  it { should belong_to(:role) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:blogs).dependent(:destroy) }

  # Validation tests
  it { should validate_presence_of(:firstname) }
  it { should validate_presence_of(:lastname) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end