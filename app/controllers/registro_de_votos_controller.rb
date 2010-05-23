class RegistroDeVotosController < ApplicationController
  # GET /registro_de_votos
  # GET /registro_de_votos.xml
  def index
    @registro_de_votos = RegistroDeVoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registro_de_votos }
    end
  end

  # GET /registro_de_votos/1
  # GET /registro_de_votos/1.xml
  def show
    @registro_de_voto = RegistroDeVoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registro_de_voto }
    end
  end

  # GET /registro_de_votos/new
  # GET /registro_de_votos/new.xml
  def new
    @registro_de_voto = RegistroDeVoto.new
    @locais = Local.all
    @chapas = Chapa.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registro_de_voto }
    end
  end

  # GET /registro_de_votos/1/edit
  def edit
    @registro_de_voto = RegistroDeVoto.find(params[:id])
  end

  # POST /registro_de_votos
  # POST /registro_de_votos.xml
  def create
    @registro_de_voto = RegistroDeVoto.new(params[:registro_de_voto])

#    puts @registro_de_voto.projeto

    respond_to do |format|
      if @registro_de_voto.save
        flash[:notice] = 'RegistroDeVoto was successfully created.'
        format.html { redirect_to(@registro_de_voto) }
        format.xml  { render :xml => @registro_de_voto, :status => :created, :location => @registro_de_voto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registro_de_voto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registro_de_votos/1
  # PUT /registro_de_votos/1.xml
  def update
    @registro_de_voto = RegistroDeVoto.find(params[:id])

    respond_to do |format|
      if @registro_de_voto.update_attributes(params[:registro_de_voto])
        flash[:notice] = 'RegistroDeVoto was successfully updated.'
        format.html { redirect_to(@registro_de_voto) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registro_de_voto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /registro_de_votos/1
  # DELETE /registro_de_votos/1.xml
  def destroy
    @registro_de_voto = RegistroDeVoto.find(params[:id])
    @registro_de_voto.destroy

    respond_to do |format|
      format.html { redirect_to(registro_de_votos_url) }
      format.xml  { head :ok }
    end
  end
end
