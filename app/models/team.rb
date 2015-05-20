class Team < ActiveRecord::Base

  has_many :players

  def goal_sum
    self.players.sum("goals")
  end

end
