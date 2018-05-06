require "rails_helper"

describe UsersController, :type => :controller do

  describe "GET #index" do
    subject { get :index }

    it "it returns a 200 status code" do
      expect(response).to have_http_status(200)
    end
  end

end