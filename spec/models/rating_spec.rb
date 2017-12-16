require 'rails_helper'

# Test suite for the Rating model
RSpec.describe Rating, type: :model do
  it { should belong_to(:post) }
end