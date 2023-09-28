# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
    # puts "Destroying tables..."
    ArtworkShare.destroy_all
    Artwork.destroy_all
    User.destroy_all

    puts "Resetting primary keys..."
    %w(users artworks artwork_shares).each do |table_name|
      ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    puts "Creating seed data..."
    u1 = User.create!(username: "yuri")
    u2 = User.create!(username: "spence")
    a1 = Artwork.create!(title: "Flowers", image_url: "google.come/image/flower", artist_id: u1.id)
    a2 = Artwork.create!(title: "Flowers 2", image_url: "google.come/image/flower", artist_id: u2.id)
    s1 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u1.id)
    s2 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u2.id)
    c1 = Comment.create!(author_id: u1.id, artwork_id: a1.id, body: "this is yuri's")

    puts "Done!"
end
