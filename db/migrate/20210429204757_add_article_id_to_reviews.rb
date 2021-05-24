class AddArticleIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :article_id, :integer
  end
end
