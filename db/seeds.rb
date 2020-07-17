Episode.all.destroy_all

(0...4).each do |i|
  episode = Episode.create!(name: "Episode #{i}")

  (0..4).each do |j|
    episode.episode_statements.create!(statement: "Statement #{j}", correct: j == 0)
  end
end
