require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'instructions' do
    let(:user) { FactoryGirl.create(:user, first_name: 'Lucas', email: 'lucas@email.com') }
    let(:teacher_user) { FactoryGirl.create(:user) }
    let(:course) { FactoryGirl.create(:course) }
    let(:raw_token) { 'test' }
    let(:mail) { UserMailer.add_to_class_email(course, user, raw_token) }

    before(:each) do
      teacher_user.add_role(:teacher, course)
    end

    it 'renders the subject' do
      expect(mail.subject).to eql("You have been signed up for the following class: #{course.class_name}!")
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
