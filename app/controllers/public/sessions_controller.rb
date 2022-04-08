# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # devise機能を実行する前にcustomer_stateメソッドを実行させる
  before_action :customer_state, only: [:create]

  # 顧客Sign_in後の遷移先
  def after_sign_in_path_for(resource)
    root_path
  end

  # 顧客Sign_out後の遷移先
  def after_sign_out_path_for(resource)
    root_path
  end

  # 退会機能の実装
  def customer_state
    ##【処理内容1】入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、メソッドを終了する
    return if !@customer
    ##【処理内容2】取得したアカウントのパスワードと入力されたパスワードが一致しているか判断
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_active == false )
      redirect_to new_customer_registration_path
    ##【処理内容3】
    else
    end

  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
