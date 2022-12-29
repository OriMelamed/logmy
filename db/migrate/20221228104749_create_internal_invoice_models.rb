class CreateInternalInvoiceModels < ActiveRecord::Migration[7.0]
  def change
    create_table :internal_invoice_models do |t|
      t.string :file_name

      t.timestamps
    end
  end
end
