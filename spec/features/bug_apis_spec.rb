require 'rails_helper'

RSpec.feature "BugApis", type: :feature do

  describe "smoke test" do
    it 'should not have any JavaScript errors', :js => true do
      visit(bug_api_index_path)
      expect(page).not_to have_errors
    end
  end

  describe "javascript 1messages" do
    it 'prints console messages', :js => true do
      visit(bug_api_index_path)
      puts page.driver.console_messages
    end
  end

end
