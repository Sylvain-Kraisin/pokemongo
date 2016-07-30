class PokemonAccountsController < ApplicationController
  require 'pp'
    before_action :find_account, only: [:show, :edit, :update]
    before_filter :authenticate_user!, only: [:new, :create, :show]

    def index
    end

    def create
      @account = PokemonAccount.new(account_params)
      @account.user_id = current_user.id

      if @account.save
        redirect_to pokemon_account_path(@account)
      else
        render 'new'
      end
    end

    def new
      @account = PokemonAccount.new
    end

    def edit
    end

    def show
      @client = Poke::API::Client.new
      @client.store_location(@account.adress)
      @client.login(@account.email, @account.password, 'google')
      # # Add RPC calls
      @client.get_player
      @client.get_inventory
      # # You can inspect the client before performing the call
      # puts @client.inspect

      # # Perform your RPC call
      @call = @client.call
      # # A <Poke::API::Response> object is returned and decorated with your request and response in a Hash format
      # # Request
      @inventory = @call.response[:GET_INVENTORY][:inventory_delta][:inventory_items]

      @pokemons = []
      @candies = {}
      @items = {}
      @pokedex = {}
      # # Response
      # puts @call.response.inspect
    end

    def update
      if @account.update(account_params)
        redirect_to pokemon_account_path(@account)
      else
        render 'edit'
      end
    end

    private
      def account_params
        params.require(:pokemon_account).permit(:email, :password, :adress)
      end

      def find_account
        @account = PokemonAccount.find(params[:id])
      end

  end
