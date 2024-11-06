class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def show
        @event = Event.find(params[:id])
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to @event, notice: 'Événement créé avec succès.'
        else
            render :new
        end
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
            redirect_to @event, notice: 'Événement mis à jour avec succès.'
        else
            render :edit
        end
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to events_path, notice: 'Événement supprimé avec succès.'
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :start_date, :duration, :price)
    end
