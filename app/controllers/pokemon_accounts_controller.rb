class PokemonAccountsController < ApplicationController
    before_action :find_account, only: [:show, :edit, :update]
    before_filter :authenticate_user!, only: [:new, :create, :show]

    def index
    end

    def create
      @account = PokemonAccount.new(account_params)

      if @account.save
        redirect_to account_path
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
