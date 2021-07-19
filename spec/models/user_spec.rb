require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'presence' do
    inv_user = User.new(id: '', email: 'sample@example.com').save
    expect(inv_user).to eq(false)
  end

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  context 'is not valid without a valid email' do
    it 'email is nil' do
      user.email = nil
      expect(user).not_to be_valid
    end
    it 'is missing an "@"' do
      user.email = 'kyle.email.com'
      expect(user).not_to be_valid
    end
  end

  context 'is not valid without a valid password' do
    it 'is too short' do
      user.password = 'pass'
      expect(user).not_to be_valid
    end
    it 'is too long' do
      user.password = 'a' * 129
      expect(user).not_to be_valid
    end
  end

  context 'Associations' do
    it 'has many reviews' do
      assc = described_class.reflect_on_association(:reviews)
      expect(assc.macro).to eq :has_many
    end

    it 'has many articles' do
      assc = described_class.reflect_on_association(:articles)
      expect(assc.macro).to eq :has_many
    end
  end
end
