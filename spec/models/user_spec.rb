require "rails_helper"

describe User do
  let(:user) { create(:user)}

  context "Full name is present" do
    it "should return name and surname" do
      expect(user.name).to eq "Hans" and expect(user.surname).to eq "ImGlück"
    end
  end

  context "Email-Adress is missing" do
    before do
      user.email = nil
    end
    it "is not valid" do
      expect(user).not_to be_valid
    end
  end
end