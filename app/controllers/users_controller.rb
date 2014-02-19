class UsersController < ApplicationController
  
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render json: UsersDatatable.new(view_context) }
    end
  end

  def show
    @usuario = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usuario }
    end
  end

  def new
    @usuario = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @usuario }
    end
  end

  def edit
    @usuario = User.find(params[:id])
  end

  def create
    @usuario = User.new(params[:user])

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to(@usuario, :notice => 'Usuario creado exitosamente.') }
        format.xml  { render :xml => @usuario, :status => :created, :location => @usuario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @usuario = User.find(params[:id])

    if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @usuario.update_attributes(params[:user])
        format.html { redirect_to(@usuario, :notice => 'Usuario actualizado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @usuario = User.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

end
