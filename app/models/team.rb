class Team < ActiveRecord::Base

  has_many :players

  def goal_sum
    Team.all.map {|t| puts "#{t.name} goals: #{t.players.sum(:goals)}"}
  end
  def sql_query
  @connection = ActiveRecord::Base.establish_connection(
      adapter: "postgresql",
      encoding: "unicode",
      database: "G_development",
      host: "localhost",
      port: 5432,
      pool: 5,
      username: "postgres",
      password: "password",
  )
  @teams = "SELECT SUM(players.goals) AS sum_players_goals, teams.name AS teams_name FROM teams LEFT OUTER JOIN players ON players.team_id = teams.id GROUP BY teams.name"
  @results = ActiveRecord::Base.connection.execute(@teams).to_json
  end
end
