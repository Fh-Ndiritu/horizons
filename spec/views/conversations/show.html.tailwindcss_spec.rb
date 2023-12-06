require 'rails_helper'

RSpec.describe "conversations/show", type: :view do
  before(:each) do
    assign(:conversation, Conversation.create!(
      product: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
