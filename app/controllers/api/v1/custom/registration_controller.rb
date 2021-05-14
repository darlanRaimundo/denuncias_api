class Custom::RegistrationsController < DeviseTokenAuth::RegistrationsController

    before_action :render_create_success

    def render_create_success
        render json: {@resource.token_validation_response}
    end

    def validate_token
        if @resource
            render json: {
                data: @resource.as_json(methods: :calculate_operating_thetan)
            }
        else
            render json: {
                success: false,
                errors: ["Invalid login credentials"]
            }, status: 401
        end
    end
end