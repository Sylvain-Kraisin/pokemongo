class WelcomeController < ApplicationController

  def index
    def pkmn_api
      client = Poke::API::Client.new
      client.store_location(self.adress)
      client.login(self.email, self.encrypted_password, 'google')
      puts client.owned_by_team
    end
  end

end
