require 'rails_helper'

RSpec.describe "gists/index", type: :view do
  before(:each) do
    assign(:gists, [
      Gist.create!(),
      Gist.create!()
    ])
  end

  it "renders a list of gists" do
    render
  end
end
