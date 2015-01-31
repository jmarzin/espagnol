class CreateMots < ActiveRecord::Migration
  def change
    create_table :mots do |t|
      t.string :mot_directeur
      t.string :francais
      t.string :espagnol

      t.timestamps
    end
  end
end
