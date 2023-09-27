# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
    puts "Destroying tables..."
    User.destroy_all
    Artwork.destroy_all
    ArtworkShare.destroy_all

    puts "Resetting primary keys..."
    %w(users artworks artwork_shares).each do |table_name|
      ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    puts "Creating seed data..."
    u1 = User.create!(username: "yuri")
    u2 = User.create!(username: "spence")
    a1 = Artwork.create!(title: "Flowers", image_url: "google.come/image/flower", artist: u1)
    s1 = ArtworkShare.create!(artwork: a1, viewer: u2)
    puts "Done!"
end
