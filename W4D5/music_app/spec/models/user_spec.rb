require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(email: "gary@gary.com", password: "password")
  end
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "identifies a correct password as true" do
      expect(user.is_password?("password")).to be true
    end

    it "identifies an incorrect password as false" do
      expect(user.is_password?("not_password")).to be false
    end
  end

  describe "#reset_session_token" do
    it "changes the user's current session token" do
      current_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(current_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }
    it "returns nil if user does not exist in database" do
      expect(User.find_by_credentials("larry@larry.com", "a_password")).to eq(nil)
    end

    it "returns nil if password is incorrect for user found" do
      expect(User.find_by_credentials("gary@gary.com", "a_password")).to eq(nil)
    end

    it "returns the user if both user is found and password is correct" do
      expect(User.find_by_credentials("gary@gary.com", "password")).to eq(user)
    end
  end

end
