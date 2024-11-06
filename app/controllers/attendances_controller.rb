class AttendancesController < ApplicationController
    
    def create
        @event = Event.find(params[:event_id]) # Trouve l'événement
        @attendance = @event.attendances.new(user_id: current_user.id) # Remplace `current_user` par la méthode appropriée pour obtenir l'utilisateur connecté

        if @attendance.save
            redirect_to @event, notice: 'Inscription réussie à l\'événement.'
        else
            redirect_to @event, alert: 'Échec de l\'inscription.'
        end
    end

    # Supprime une inscription à un événement
    def destroy
        @attendance = Attendance.find(params[:id])
        @attendance.destroy
        redirect_to events_path, notice: 'Désinscription réussie.'
    end
end
