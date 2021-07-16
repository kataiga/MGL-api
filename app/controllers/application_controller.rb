class ApplicationController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken

    #quanf l'erreur RecordNotDestroyed et renvoyer peut importe ou dans l'application on utilise la methode not_destroyed
    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

    before_action :configure_permitted_parameters, if: :devise_controller?
    # disable wrapper so the request is not wrapped into a :registration object since it's not needed with devise_token_auth 
    wrap_parameters false, if: :devise_controller?

    private

    def not_destroyed(e)
        render json: {errors: e.record.errors }, status: :unprocessable_entity
    end

    def configure_permitted_parameters
        # for user account creation i.e sign up
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :image])
        # for user account update
        # where bank_name and bank_account are nested attributes in the User model
        # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, bank_attributes: [:bank_name, :bank_account]])
      end
end
