class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :job_type
      t.text :description
      t.string :city
      t.boolean :remote
      t.string :company
      t.string :contact_email
      t.string :contact_site
      t.string :contact_phone
      t.string :contact_person
      t.decimal :salary
      t.string :currency

      t.timestamps
    end
  end
end
