class AddUserIdToPokemonAccounts < ActiveRecord::Migration
  def change
    add_column :pokemon_accounts, :user_id, :integer
  end
end
