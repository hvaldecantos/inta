class CaniaVariedadesController < ApplicationController
  
  load_and_authorize_resource

  # GET /cania_variedades
  # GET /cania_variedades.json
  def index
    @cania_variedades = CaniaVariedad.all
    @view = view_context
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cania_variedades }
    end
  end

  # GET /cania_variedades/1
  # GET /cania_variedades/1.json
  def show
    @cania_variedad = CaniaVariedad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cania_variedad }
    end
  end

  # GET /cania_variedades/new
  # GET /cania_variedades/new.json
  def new
    @cania_variedad = CaniaVariedad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cania_variedad }
    end
  end

  # GET /cania_variedades/1/edit
  def edit
    @cania_variedad = CaniaVariedad.find(params[:id])
  end

  # POST /cania_variedades
  # POST /cania_variedades.json
  def create
    @cania_variedad = CaniaVariedad.new(params[:cania_variedad])

    respond_to do |format|
      if @cania_variedad.save
        format.html { redirect_to @cania_variedad, notice: 'Cania variedad was successfully created.' }
        format.json { render json: @cania_variedad, status: :created, location: @cania_variedad }
      else
        format.html { render action: "new" }
        format.json { render json: @cania_variedad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cania_variedades/1
  # PUT /cania_variedades/1.json
  def update
    @cania_variedad = CaniaVariedad.find(params[:id])

    respond_to do |format|
      if @cania_variedad.update_attributes(params[:cania_variedad])
        format.html { redirect_to @cania_variedad, notice: 'Cania variedad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cania_variedad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cania_variedades/1
  # DELETE /cania_variedades/1.json
  def destroy
    @cania_variedad = CaniaVariedad.find(params[:id])
    @cania_variedad.destroy

    respond_to do |format|
      format.html { redirect_to cania_variedades_url }
      format.json { head :no_content }
    end
  end
end
