class StateRecividismsController < ApplicationController

  def index
    # to get json
    # curl  -H "Accept: application/json" -H "Content-Type: application/json" localhost:3000

    @state_recividisms = StateRecividism.all

    respond_to do |format|
      format.html
      format.json {render json: @state_recividisms, root: false }
    end
  end

end
