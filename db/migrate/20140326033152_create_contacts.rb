class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :to
      t.string :from
      t.string :body
      t.string :subject

      t.timestamps
    end
  end
end
