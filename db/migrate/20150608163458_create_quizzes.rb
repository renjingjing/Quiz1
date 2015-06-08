class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name
      t.string :email
      t.string :department
      t.string :message
      t.boolean :action

      t.timestamps null: false
    end
  end
end
