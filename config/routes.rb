DeskReservation::Application.routes.draw do
  
  get "calendar/create"
  get "calendar_controller/create"
  root to: 'calendar#home'

  end
