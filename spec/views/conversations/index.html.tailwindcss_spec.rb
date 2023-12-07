require 'rails_helper'

RSpec.describe "conversations/index", type: :view do
  before(:each) do
    assign(:conversations, [create(:conversation), create(:conversation)])
  end

  it "renders a list of conversations" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
