require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
      product =create(:product)
    assign(:product, product)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
  end
end
