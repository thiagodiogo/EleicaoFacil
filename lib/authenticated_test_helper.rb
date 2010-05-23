module AuthenticatedTestHelper
  # Sets the current usuario in the session from the usuario fixtures.
  def login_as(usuario)
    @request.session[:usuario_id] = usuario ? (usuario.is_a?(Usuario) ? usuario.id : usuarios(usuario).id) : nil
  end

  def authorize_as(usuario)
    @request.env["HTTP_AUTHORIZATION"] = usuario ? ActionController::HttpAuthentication::Basic.encode_credentials(usuarios(usuario).login, 'monkey') : nil
  end
  
end
