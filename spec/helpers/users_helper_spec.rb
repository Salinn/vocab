require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UserHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  let(:valid_user_attributes) {
    {
        first_name: 'Paul',
        last_name: 'Darragh',
        email: 'pmd6624@rit.edu',
        password: 'topsecret',
        password_confirmation: 'topsecret'
    }
  }

  let(:invalid_user_attributes) {
    {
        first_name: '',
        last_name: '',
        email: 'pmd6624@rit.edu',
        password: 'topsecret',
        password_confirmation: 'topsecret'
    }
  }

  describe 'Returns Valid Name Information' do
    it "returns the correct first name of the user" do
      user = User.create!(valid_user_attributes)
      expect(first_name(user)).to eql('Paul')
    end
    it "returns the correct last name of the user" do
      user = User.create!(valid_user_attributes)
      expect(last_name(user)).to eql('Darragh')
    end
    it "returns the correct full name of the user" do
      user = User.create!(valid_user_attributes)
      expect(user_name(user)).to eql('Paul Darragh')
    end
    it "returns the correct email of the user" do
      user = User.create!(valid_user_attributes)
      expect(email(user)).to eql('pmd6624@rit.edu')
    end
  end

  describe 'Ensures a user who did not fill in information is handled' do
    it "tests against an incorrect first name" do
      user = User.create!(invalid_user_attributes)
      expect(first_name(user)).to eql('N/A')
    end
    it "tests against an incorrect last name" do
      user = User.create!(invalid_user_attributes)
      expect(last_name(user)).to eql('N/A')
    end
    it "tests against an incorrect full name" do
      user = User.create!(invalid_user_attributes)
      expect(user_name(user)).to eql('N/A N/A')
    end
    it "tests against an incorrect email" do
      user = User.create!(invalid_user_attributes)
      expect(email(user)).to eql('pmd6624@rit.edu')
    end
  end
end
