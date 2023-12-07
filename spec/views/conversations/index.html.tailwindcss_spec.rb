require 'rails_helper'

RSpec.describe "conversations/index", type: :view do
  before(:each) do
    product = create(:product, title: "The first product")
    assign(:conversations, [create(:conversation, product: product), create(:conversation, product: product)])
  end

  it "renders a list of conversations" do
    render 

    expect(rendered).to have_text("The first product")
    
  end
end
