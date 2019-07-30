require 'rails_helper'

RSpec.describe "gists/edit", type: :view do
  before(:each) do
    @gist = assign(:gist, Gist.create!())
  end

  it "renders the edit gist form" do
    render

    assert_select "form[action=?][method=?]", gist_path(@gist), "post" do
    end
  end
end
