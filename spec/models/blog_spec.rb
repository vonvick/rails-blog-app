require 'rails_helper'

RSpec.describe Blog, type: :model do
  # Association test
  it { should belong_to(:user) }
  it { should have_many(:comments).dependent(:destroy) }

  # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:published) }
end