require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'instructions' do
    let(:user) {  FactoryGirl.create(:user, first_name: 'Lucas', email: 'lucas@email.com') }
    let(:mail) { UserMailer.add_to_class_email(user) }

    it 'renders the subject' do
      expect(mail.subject).to eql('You have been signed up for a class!')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['team.vocabulary@gmail.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.first_name)
    end
  end
end
