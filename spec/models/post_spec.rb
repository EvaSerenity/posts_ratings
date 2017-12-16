require 'rails_helper'

# Test suite for the Post model
RSpec.describe Post, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:ratings) }
end