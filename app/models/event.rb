class Event < ApplicationRecord
    validates :start_date, presence: true
    validates :start_date_in_the_future
    validates :duration, presence: true, numericality: { greater_than: 0 } 
    validates :title, presence: true, lenght: { minimum 5, maximum 140 }
    validates :description, presence: true, lenght: { minimum 20, maximum 1000 }
    validates :price, presence: true, numericality (1..1000)
    validates :location, presence: true
end
