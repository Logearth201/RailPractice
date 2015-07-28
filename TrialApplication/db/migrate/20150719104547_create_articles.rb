class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :text
      t.string :title
      t.string :userid
      t.date :submitday
      t.integer :ordernumber
      #picture only

      t.timestamps
    end
  end
end
