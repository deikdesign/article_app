require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context 'tests' do
    it 'presence' do
      user = User.new(id: '', email: 'sample@example.com').save
      expect(user).to eq(false)
    end
  end
end
