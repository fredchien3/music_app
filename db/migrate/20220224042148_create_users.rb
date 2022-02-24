class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true } # index uniqueness of emails
      t.string :password_digest, null: false
      t.string :session_token, null: false, index: true # speed up lookup of session token with index

      t.timestamps
    end
  end
end
