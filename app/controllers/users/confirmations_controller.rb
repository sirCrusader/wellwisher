class Users::ConfirmationsController < Devise::ConfirmationsController
  layout 'landing'
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(persons_profile_path)
    end
  end
end