require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    subject { 
      described_class.new(first_name: 'Jane',
                          last_name: 'Doe',
                          email: 'janedoe@email.ca',
                          password_digest: 'password123') }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    
    it 'is not valid without a first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without email' do
      subject.email = nil
      subject.password = nil
      expect(subject).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should match password and email' do
      user = User.create(first_name: 'Otis', last_name: 'Westlake', email: 'otis@lighthouse.ca', password: 'pleasework', password_confirmation: 'pleasework')

      session = User.authenticate_with_credentials('otis@lighthouse.ca', 'pleasework')

      expect(session).to eq user
    end

    it 'should be false if not legit email and password' do
     otis = User.create(first_name: 'Otis', 
                       last_name: 'Westlake', 
                       email: 'otis@lighthouse.ca', 
                       password: 'yunochaseme',
                       password_confirmation: 'yunochaseme')

      false_session = User.authenticate_with_credentials('otis@lighthouse.ca', 'yuchaseme')
      expect(otis).to_not eq false_session
    end

  end

end
