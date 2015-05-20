require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many(:players)}
  it "sums goals" do
    t = create(:team, name: "Sid")
    p = create(:player, name: "clap", goals: 3, team_id: t.id)
    p1 = create(:player, name: "clap", goals: 3, team_id: t.id)
    expect(t.goal_sum).to eq 6
  end
end
