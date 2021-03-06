require 'rails_helper'

RSpec.describe "Gists", type: :request do
  before :each do
    @gist = Gist.create(title: SecureRandom.hex(10),
                        filename: SecureRandom.hex(10),
                        contents: SecureRandom.hex(100))
  end

  describe "DELETE /gists" do
    it "deletes the given gist" do
      gist_params = {
          title: "Test",
          filename: "test.md",
          contents: "#Testing"
      }
      gist = Gist.create(gist_params)
      expect {
        delete gist_path(gist)
      }.to change(Gist, :count).by(-1)
    end
  end

  describe "PUT /gists" do
    it "modifies an existing gist" do
      gist_params = {
          title: "Test",
          filename: "test.md",
          contents: "#Testing"
      }
      gist = Gist.create(gist_params)
      # expect {
# binding.pry
        put gist_path(gist), params: { gist: gist_params.merge(title: "Testing") }
        expect { gist.reload.title != gist_params[:title] }
      # }.to change(gist, :reload)
    end
  end

  describe "POST /gists" do
    it "creates a new gist" do
      expect {
        gist_params = {
          title: "Test",
          filename: "test.md",
          contents: "#Testing"
        }
        post gists_path, params: { gist: gist_params }
      }.to change(Gist, :count).by(1)
    end
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
