class CreateMoviegoers < ActiveRecord::Migration[6.0]
  def change
    create_table :moviegoers do |t|
      t.string :name
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
