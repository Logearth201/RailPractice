class CreateMemberImages < ActiveRecord::Migration
  def change
    create_table :member_images do |t|

      t.timestamps
    end
  end
end
