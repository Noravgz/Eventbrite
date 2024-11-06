class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    # def show
    #     @user = User.find(params[:id])
    # end

    def create
        @user = User.new(user_params)
            
        if @user.save
            redirect_to @user, notice: 'Inscription réussie !'# Rediriger vers le profil ou la page d'accueil
        else
            render :new # Rendre à la vue new avec les erreurs
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
  
        if @user.update(user_params)
            redirect_to @user, notice: 'Profil mis à jour avec succès !'# Rediriger vers le profil
        else
            render :edit # Rendre à la vue edit avec les erreurs
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        # Rediriger vers la page d'accueil ou une page de confirmation
        redirect_to root_path, notice: 'Compte supprimé avec succès.'
    end

    private

    def user_params
        # Permet uniquement les paramètres autorisés pour la création ou la mise à jour d'un utilisateur
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end

