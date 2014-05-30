class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|

      t.text :title

      t.string :article_url

      t.string :tag

      t.integer :user_id

      t.text :description


      t.timestamps

    end

  end
end
