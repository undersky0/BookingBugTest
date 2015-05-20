class BugApi < ActiveRecord::Base

  include HTTParty
  base_uri 'https://bookingbug.com/api/v1'
  USER = ENV['my_email']
  PASSWORD = ENV['my_password']
  headers "App-Id" => ENV['booking_bug_id'], "App-Key" => ENV['booking_bug_key']

  def self.get_token(company_id, page=1, per_page=300)
    response = HTTParty.get("https://www.bookingbug.com/api/v1/#{company_id}/services",
                       :headers => headers,
                        :query => {:page => page, :per_page => per_page},
                             :debug_output => $stdout
    ).parsed_response
    r = response['_embedded']['services']
    names = Array.new
    r.each {|k,v| names << k['name']}
    return names.last(2)
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
