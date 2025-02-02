
class AtuendosController < ApplicationController
  before_action :set_guardarropa, except: [:create,:index]
  before_action :set_atuendo, only: [:show, :update, :edit, :destroy]

  def index
    @guardarropa = Guardarropa.find(params[:guardarropa_id])
    @atuendos = @guardarropa.atuendos.all.all.page params[:page]

  end

  def show
  end

  def edit
  end

  def newrandom
    @atuendo = @guardarropa.atuendos.new
    @prendas = @guardarropa.prendas
  end

  def new
    @atuendo = @guardarropa.atuendos.new
    @prendas = @guardarropa.prendas
  end

  def create
    @atuendo= Atuendo.create(atuendo_params)
    redirect_to controller: 'guardarropas', action: 'show', id:@atuendo.guardarropa_id
  end
  def destroy
    @atuendo.destroy!
    redirect_to :action => :index
  end


  def update
    @atuendo.update! guardarropa_params
    redirect_to @atuendo
  end

  private

  def set_atuendo
    @atuendo = @guardarropa.atuendos.find(params[:id])
  end

  def set_guardarropa
    @guardarropa= Guardarropa.find(params[:guardarropa_id])
  end

  def atuendo_params
    params.require(:atuendo).permit(:nombre, :clasificacion, :etiqueta, :guardarropa_id,prenda_ids:[])
  end

end

