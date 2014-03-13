RecidivismVisualizer::Application.routes.draw do
  get "state_recividisms/index"
  root "state_recividisms#index"
end
