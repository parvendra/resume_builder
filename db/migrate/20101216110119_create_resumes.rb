class CreateResumes < ActiveRecord::Migration
  def self.up
    create_table :resumes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :resumes
  end
end
