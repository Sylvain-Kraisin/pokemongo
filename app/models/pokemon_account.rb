class PokemonAccount < ActiveRecord::Base
  require 'poke-api'

  # after_commit :pkmn_api, on: :create
  #
  # def pkmn_api
  #   client = Poke::API::Client.new
  #   client.store_location('Paris')
  #   client.login(self.email, self.encrypted_password, 'google')
  #   raise
  # end
end
