require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures email presence' do
      user = User.new(email: '', password: 'password', password_confirmation: 'password').save
      expect(user).to eq(false)
    end

    it 'ensures password presence' do
      user = User.new(email: 'test@testing.com', password: '', password_confirmation: '').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(email: 'test@testing.com', password: 'password', password_confirmation: 'password').save
      expect(user).to eq(true)
    end
  end

end
