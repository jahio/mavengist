require 'rails_helper'

RSpec.describe "Gists", type: :request do
  before :each do
    @gist = Gist.create(title: SecureRandom.hex(10),
                        filename: SecureRandom.hex(10),
                        contents: SecureRandom.hex(100))
  end
  describe "GET /gists" do

    it "displays a list of gists" do
      get gists_path
      expect(response).to have_http_status(200)
      expect(assigns(:gists)).to_not be_nil
      expect(assigns(:gists).count).to be > 0
    end
  end

  describe "GET /gists/:id" do
    it "renders the gist" do
      get gist_path(@gist.reload)
      expect(response.code.to_i).to eq 200
      expect(assigns(:gist)).to_not be_nil
    end
  end
end
