require 'rails_helper'

RSpec.describe "gists/show", type: :view do
  before(:each) do
    @gist = assign(:gist, Gist.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
