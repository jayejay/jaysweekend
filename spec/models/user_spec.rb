require "rails_helper"

describe User do
  context "Full name is present" do
    let(:user) { User.new(name: "Julian", surname: "Eissing")}

    it "should return name and surname" do
      expect(user.name).to eq "Julian" and expect(user.surname).to eq "Eissing"
    end
  end

  context "Email-Adress is missing" do
    it "is not valid" do
      expect(User.new(email:"")).not_to be_valid
    end
  end
end