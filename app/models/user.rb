class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_commit :pkmn_api, on: :create

  def pkmn_api
    client = Poke::API::Client.new
    client.store_location('Paris')
    client.login(self.email, self.encrypted_password, 'google')
    raise
  end
end
