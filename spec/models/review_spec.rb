require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { create(:user) } # equivalent to User.create({})
  let(:category) { create(:category) }
  let!(:user_article) { create(:article, user_id: user.id, category_id: category.id) }
  let(:review) { build(:review, user_id: user.id, article_id: user_article.id) }

  describe 'Associations' do
    it { should belong_to(:user) }

    it { should belong_to(:article) }
  end
  it 'is valid with valid attributes' do
    expect(review).to be_valid
  end

  it 'is not valid without a valid article_id' do
    review.article_id = 0
    expect(review).not_to be_valid
  end

  it 'is not valid without a valid user_id' do
    review.user_id = 0
    expect(review).not_to be_valid
  end
end
