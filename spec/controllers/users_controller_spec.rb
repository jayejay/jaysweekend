require "rails_helper"

describe UsersController, :type => :controller do
  describe "GET #index" do
    subject { get :index }

    it "it returns a 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(subject).to render_template(:index)
    end
  end
end