class ProductoresController < ApplicationController
  # GET /productores
  # GET /productores.json
  def index
    @productores = Productor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productores }
    end
  end

  # GET /productores/1
  # GET /productores/1.json
  def show
    @productor = Productor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @productor }
    end
  end

  # GET /productores/new
  # GET /productores/new.json
  def new
    @productor = Productor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @productor }
    end
  end

  # GET /productores/1/edit
  def edit
    @productor = Productor.find(params[:id])
  end

  # POST /productores
  # POST /productores.json
  def create
    @productor = Productor.new(params[:productor])

    respond_to do |format|
      if @productor.save
        format.html { redirect_to @productor, notice: 'Productor was successfully created.' }
        format.json { render json: @productor, status: :created, location: @productor }
      else
        format.html { render action: "new" }
        format.json { render json: @productor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /productores/1
  # PUT /productores/1.json
  def update
    @productor = Productor.find(params[:id])

    respond_to do |format|
      if @productor.update_attributes(params[:productor])
        format.html { redirect_to @productor, notice: 'Productor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @productor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productores/1
  # DELETE /productores/1.json
  def destroy
    @productor = Productor.find(params[:id])
    @productor.destroy

    respond_to do |format|
      format.html { redirect_to productores_url }
      format.json { head :no_content }
    end
  end
end
