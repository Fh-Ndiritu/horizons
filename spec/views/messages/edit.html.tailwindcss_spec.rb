require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  let(:message) {
    Message.create!(
      user: nil,
      conversation: nil,
      content: nil
    )
  }

  before(:each) do
    assign(:message, message)
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(message), "post" do

      assert_select "input[name=?]", "message[user_id]"

      assert_select "input[name=?]", "message[conversation_id]"

      assert_select "input[name=?]", "message[content]"
    end
  end
end
