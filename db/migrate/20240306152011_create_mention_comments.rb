class CreateMentionComments < ActiveRecord::Migration[7.1]
  def change
    create_table :mention_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task_comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
