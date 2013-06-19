class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'No es posible registrarse, sólo el administrador puede crear usuarios.'
    redirect_to root_path
  end

  def create
    flash[:info] = 'No es posible registrarse, sólo el administrador puede crear usuarios.'
    redirect_to root_path
  end
end
