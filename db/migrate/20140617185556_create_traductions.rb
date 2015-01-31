class CreateTraductions < ActiveRecord::Migration
  def change
    create_table :traductions do |t|
      t.string :espagnol
      t.string :francais

      t.timestamps
    end
  end
end
