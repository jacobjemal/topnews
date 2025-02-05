require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "Title",
        user: "User",
        up_vote: 2
      ),
      Post.create!(
        title: "Title",
        user: "User",
        up_vote: 2
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "User".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
