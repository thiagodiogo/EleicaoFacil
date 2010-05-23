class ChapasController < ApplicationController
  # GET /chapas
  # GET /chapas.xml
  def index
    @chapas = Chapa.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chapas }
    end
  end

  # GET /chapas/1
  # GET /chapas/1.xml
  def show
    @chapa = Chapa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chapa }
    end
  end

  # GET /chapas/new
  # GET /chapas/new.xml
  def new
    @chapa = Chapa.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chapa }
    end
  end

  # GET /chapas/1/edit
  def edit
    @chapa = Chapa.find(params[:id])
  end

  # POST /chapas
  # POST /chapas.xml
  def create
    @chapa = Chapa.new(params[:chapa])

    respond_to do |format|
      if @chapa.save
        flash[:notice] = 'Chapa was successfully created.'
        format.html { redirect_to(@chapa) }
        format.xml  { render :xml => @chapa, :status => :created, :location => @chapa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chapa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chapas/1
  # PUT /chapas/1.xml
  def update
    @chapa = Chapa.find(params[:id])

    respond_to do |format|
      if @chapa.update_attributes(params[:chapa])
        flash[:notice] = 'Chapa was successfully updated.'
        format.html { redirect_to(@chapa) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chapa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chapas/1
  # DELETE /chapas/1.xml
  def destroy
    @chapa = Chapa.find(params[:id])
    @chapa.destroy

    respond_to do |format|
      format.html { redirect_to(chapas_url) }
      format.xml  { head :ok }
    end
  end
end
