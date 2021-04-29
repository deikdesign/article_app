class Article < ApplicationRecord
    belongs_to :user
    belongs_to :category

    
        

    has_attached_file :article_img, styles: { article_index: "250x350>", article_show: "325x475>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :article_img, content_type: /\Aimage\/.*\z/
          
      

end
