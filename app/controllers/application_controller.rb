class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
   
   def after_sign_in_path_for(resource)
 #after_sign_in_path_forはDeviseが用意しているメソッドで、サインイン後にどこに遷移するかを設定しているメソッド
 #resourceという引数には、ログインを実行したモデルのデータ、今回の場合はログインした@userのインスタンスが格納。
 flash[:notice] = "Signed in successfully."
   user_path(resource)#showページに飛んだら、ログインが完了してカレントユーザに情報が入る。
   
   end

   def after_sign_out_path_for(resource)
    root_path
   end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
