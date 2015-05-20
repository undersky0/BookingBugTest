class BugApi < ActiveRecord::Base

  include HTTParty
  base_uri 'https://bookingbug.com/api/v1'
  USER = ENV['my_email']
  PASSWORD = ENV['my_password']
  headers "App-Id" => ENV['booking_bug_id'], "App-Key" => ENV['booking_bug_key']
  # curl -v -H "App-Id:id" -H "App-Key:key" -X POST "https://www.bookingbug.com/api/v1/login" -d 'email=bbmail&password=bbpassword'
  def self.get_token
    response = HTTParty.post("#{base_uri}/login",
                       :headers => headers,
                       :body => {
                           :email => USER,
                           :password => PASSWORD
                  }, :debug_output => $stdout
    )
  end

  def self.delete_numbers(a=[4,7,8,'x'])
    if a.kind_of?(Array)
      a.delete_if { |x| x.between?(6,9) if x.is_a? Fixnum }
    end
  end

  def self.random_boolean(n = 5)
    a = Array.new(n) { Array.new(n) }
    a.map { |x| x.map { |y| y = ["Yes", "No", "Maybe"].sample } }
  end

  def self.permutator(a=[4,7,8,'x'])
    if a.kind_of?(Array)
      a.length.times { |n| print a.permutation(n).to_a }
    end
  end

end
