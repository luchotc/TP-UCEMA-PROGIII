class AddGuardarropaIdToAtuendo < ActiveRecord::Migration[6.0]
  def change
    add_column :atuendos, :guardarropa_id, :integer, index:true
  end
end
