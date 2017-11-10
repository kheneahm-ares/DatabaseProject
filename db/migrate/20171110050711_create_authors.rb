class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :fName
      t.string :lName

      t.timestamps
    end
  end
end
