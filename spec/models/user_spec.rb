require 'rails_helper'

# Test suite for the User model
RSpec.describe User, type: :model do
  it { should have_many(:posts) }
end