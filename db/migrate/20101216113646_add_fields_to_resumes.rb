class AddFieldsToResumes < ActiveRecord::Migration
  def self.up
    add_column :resumes, :name, :string
    add_column :resumes, :age, :integer
    add_column :resumes, :address, :string
    add_column :resumes, :format, :string
  end

  def self.down
    remove_column :resumes, :format
    remove_column :resumes, :address
    remove_column :resumes, :age
    remove_column :resumes, :name
  end
end
