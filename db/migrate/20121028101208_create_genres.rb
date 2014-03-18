class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name

      t.timestamps
    end
    Genre.create([{name: "Blues"}, {name: "Country"}, {:name => "Electronic"}, {:name => "Hip hop"}, {:name => "Jazz"},
                  {:name => "Reggae"}, {:name => "Rock"}, {:name => "Pop"}, {:name => "Afro Juju"}])
  end
end
