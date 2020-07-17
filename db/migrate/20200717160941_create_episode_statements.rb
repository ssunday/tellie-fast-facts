class CreateEpisodeStatements < ActiveRecord::Migration[6.0]
  def change
    create_table :episode_statements do |t|
      t.belongs_to :episode, null: false, foreign_key: true
      t.string :statement
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
