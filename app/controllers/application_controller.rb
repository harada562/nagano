class ApplicationController < ActionController::Base
	# deviseの機能使用される前にconfigure_permitted_parametersが実行されます
	before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  # defでは devise_parameter_sanitizer.permitでlast_nameを操作する許可するアクションメソッドが指定されています
  # sign_up, keys: [:last_name])ではサインアップ時にlast_nameの操作が許可された。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:postal_code])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:telephone_number])
  end
end
