class Update < ActiveRecord::Migration
  def up
    add_column :answers, :question_option_id, :integer
    remove_column :answers, :question_id
  end

  def down
    add_column :answers, :question_id, :integer
    remove_column :answers, :question_option_id
  end
end
