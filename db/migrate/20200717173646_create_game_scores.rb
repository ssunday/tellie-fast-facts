class CreateGameScores < ActiveRecord::Migration[6.0]
  def change
    create_table :game_scores do |t|
      t.belongs_to :episode, null: false, foreign_key: true
      t.integer :score, default: 0
      t.string :username

      t.timestamps
    end
  end
end
