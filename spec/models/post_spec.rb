require 'rails_helper'
require 'spec_helper'
RSpec.describe Post, type: :model do
  it { should validate_presence_of(:content)}
  it { should validate_presence_of(:user_id)}
end
