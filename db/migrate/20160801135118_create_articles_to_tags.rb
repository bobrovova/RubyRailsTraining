class CreateArticlesToTags < ActiveRecord::Migration
  def change
    create_table :articles_to_tags do |t|
      t.integer :article_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
