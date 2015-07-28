class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|

      t.string :name
      t.string :password
      t.string :password_confirmation
      t.integer :life
      t.integer :score
      t.string :email
      t.boolean :administrator, null:false, default:false
      
      t.timestamps
    end
  end
end
