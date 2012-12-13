class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.references :interviewee
      t.references :interviewer
      t.boolean :approve
      t.text :notes

      t.timestamps
    end
    add_index :interviews, :interviewee_id
    add_index :interviews, :interviewer_id
  end
end
