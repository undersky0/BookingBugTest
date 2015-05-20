class Team < ActiveRecord::Base

  has_many :players

  scope :goals_sum, -> {self.players.sum(:goals)}

  def goal_sum
    self.players.sum("goals")
  end

end
