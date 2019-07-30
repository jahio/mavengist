require 'rails_helper'

RSpec.describe "gists/new", type: :view do
  before(:each) do
    assign(:gist, Gist.new())
  end

  it "renders new gist form" do
    render

    assert_select "form[action=?][method=?]", gists_path, "post" do
    end
  end
end
