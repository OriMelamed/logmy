# frozen_string_literal: true

RSpec.describe User, type: :model do
    subject { build(:user) }

    it { should be_valid }

    describe 'change name' do
      let(:new_name) { 'foo' }
  
      it 'change name' do
        subject.name = new_name
        expect(subject.name).to eq('foo')
      end

      it { validate_uniqueness_of(:email) }

    end

    describe 'change password' do
        let(:new_password) { Faker::Internet.password(min_length: 8) }
        it 'check the password' do
            expect(subject.password).not_to eq(new_password)
        end
    end
  end
  