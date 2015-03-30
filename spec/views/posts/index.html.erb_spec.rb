require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :content => "Content",
        :user_id => 1
      ),
      Post.create!(
        :content => "Content",
        :user_id => 1
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
