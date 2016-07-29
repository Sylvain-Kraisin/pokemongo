class PokemonAccount < ActiveRecord::Base
  require 'poke-api'

  belongs_to :user

  # after_commit :pkmn_api, on: :create

  # def pkmn_api
  #   client = Poke::API::Client.new
  #   client.store_location('Paris')
  #   client.login(self.email, self.encrypted_password, 'google')
  #   puts client.owned_by_team
  # end
end
