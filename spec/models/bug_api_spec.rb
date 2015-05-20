require 'rails_helper'

RSpec.describe BugApi, type: :model do

  describe "functions 1-3" do
    it "random booleans in 5x5 array" do
      expect(BugApi.random_boolean.length).to eq(5)
      expect(BugApi.random_boolean.flatten).to include("Yes", "No", "Maybe")
    end

    it "deletes numbers 6-9" do
      expect(BugApi.delete_numbers).to match_array([4,'x'])
    end

    it "delete numbers returns nil for string" do
      expect(BugApi.delete_numbers("string")).to be_nil
    end

    it "returns permutated array" do
      expect(BugApi.permutator([1,2])).to eq(2)
    end
  end

end
