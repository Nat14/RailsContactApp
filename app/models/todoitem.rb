class Todoitem < ActiveRecord::Base

  has_many(:comments)
# Story: As a programmer, I can create a new ToDo record with title and description.
  def create_todo_item(title, description)
    new_item = Todoitem.new
    new_item.title = title
    new_item.description = description
    new_item.save
  end

# Story: As a programmer, I can list all ToDo records.
  def self.list_all
    Todoitem.all
  end

# Story: As a programmer, I can set a ToDo record to done given the ID of the record
  def self.settodone(id)
    new_item = Todoitem.find(id)
    new_item.done = true
    new_item.save
   end

# Story: As a programmer, I can list all the records that are done.
  def self.list_done
    Todoitem.all.where('"done" = true')
  end

# Story: As a programmer, I can list all the records that are done
  def self.list_not_done
    Todoitem.all.where('"done" = false')
  end

# Story: As a programmer, I can update the title and description of a ToDo record given the ID of the record.
  def self.update_item(id, title, description)
    new_item = Todoitem.find(id)
    new_item.title = title
    new_item.description = description
    new_item.save
  end

# Story: As a programmer, I can destroy a ToDo record given the ID of the record.
  def self.delete_item(id)
    Todoitem.find(id).destroy
  end

# Story: As a programmer, I can set a ToDo record with a due date.
  def self.set_tododate(id, date)
    new_item = Todoitem.find(id)
    new_item.duedate = date
    new_item.save
  end

  # Story: As a programmer, I can list all the records with a due date.
  def self.list_with_dates
    new_item = Todoitem.all.where('"duedate" IS NOT NULL')
  end

  # Story: As a programmer, I can list all the records without a due date.
  def self.list_with_no_dates
    new_item = Todoitem.all.where('"duedate" IS NULL')
  end


end
