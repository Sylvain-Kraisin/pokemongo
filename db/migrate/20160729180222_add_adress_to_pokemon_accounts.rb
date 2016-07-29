class AddAdressToPokemonAccounts < ActiveRecord::Migration
  def change
    add_column :pokemon_accounts, :adress, :string
  end
end
