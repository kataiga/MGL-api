class ApplicationController < ActionController::API
    #quanf l'erreur RecordNotDestroyed et renvoyer peut importe ou dans l'application on utilise la methode not_destroyed
    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

    private

    def not_destroyed(e)
        render json: {errors: e.record.errors }, status: :unprocessable_entity
    end
end
