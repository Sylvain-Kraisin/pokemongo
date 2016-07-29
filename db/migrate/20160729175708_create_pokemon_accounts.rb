class CreatePokemonAccounts < ActiveRecord::Migration
  def change
    create_table :pokemon_accounts do |t|
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
