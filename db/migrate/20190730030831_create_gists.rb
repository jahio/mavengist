class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists, id: :uuid do |t|
      t.string      :title
      t.string      :filename
      t.text        :contents
      t.timestamps
    end
  end
end
