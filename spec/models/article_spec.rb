require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'Has a title' do
    article = Article.new(
      title: '',
      description: '',
      author: ''
    )

    expect(article).to_not be_valid
    article.title = 'A valid Title'
    expect(article).to_not be_valid
  end

  it 'Has a Description' do
    article = Article.new(
      title: '',
      description: '',
      author: ''
    )
    expect(article).to_not be_valid
    article.description = 'A valid descrip[tion'
    expect(article).to_not be_valid
  end

  it 'Has a Title at least 1 characters minimum' do
    article = Article.new(
      title: 'A valid Title',
      description: '',
      author: ''
    )
    expect(article).to_not be_valid
    article.title = ''
    expect(article).to_not be_valid
  end
end
