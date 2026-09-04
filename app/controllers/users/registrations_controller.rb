class Users::RegistrationsController < Devise::RegistrationsController
  # 省略

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    mypage_path(resource)
  end

  # 省略

end