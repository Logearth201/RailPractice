class CreateArticleImages < ActiveRecord::Migration
  def change
    create_table :article_images do |t|
      t.references :article, null: false
      t.binary :picture, limit: 16.megabytes
      t.string :content_type
      
      t.timestamps
    end
    
    add_index :article_images, :article_id
  end
end
