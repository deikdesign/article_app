class AddAttachmentArticleImgToArticles < ActiveRecord::Migration[4.2]
  def self.up
    change_table :articles do |t|
      t.attachment :article_img
    end
  end

  def self.down
    remove_attachment :articles, :article_img
  end
end
