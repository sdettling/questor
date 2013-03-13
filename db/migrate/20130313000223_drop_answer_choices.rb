class DropAnswerChoices < ActiveRecord::Migration
  def up
    add_column :answers, :user_id, :integer
    drop_table :answer_choices
  end
  def down
    create_table :answer_choices do |t|
      t.integer :answer_id
      t.integer :question_choice_id

      t.timestamps
    end
  end
end
