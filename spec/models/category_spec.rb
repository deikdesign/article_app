require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { build(:category) }

  context 'is not valid without a name' do
    it 'name is nil' do
      category.name = nil
      expect(category).not_to be_valid
    end
  end

  context 'Associations' do
    it 'has many articles' do
      assc = described_class.reflect_on_association(:articles)
      expect(assc.macro).to eq :has_many
    end
  end
end
