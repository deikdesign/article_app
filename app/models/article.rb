class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  acts_as_votable

  # has_attached_file :article_img, styles: { article_index: '250x350>', article_show: '325x475>' },
  #                                 default_url: '/images/:style/missing.png'
  has_attached_file :article_img
  validates :title, presence: true
  validates_attachment_content_type :article_img, content_type: %r{\Aimage/.*\z}
end
