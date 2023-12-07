require 'rails_helper'

RSpec.describe "conversations/show", type: :view do
  before(:each) do
    assign(:conversation, create(:conversation))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
