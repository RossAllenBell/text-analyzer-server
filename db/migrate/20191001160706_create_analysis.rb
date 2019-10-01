class CreateAnalysis < ActiveRecord::Migration[6.0]
  def change
    create_table :analyses do |t|
      t.string :file_name
      t.json :data

      t.timestamps
    end
  end
end
