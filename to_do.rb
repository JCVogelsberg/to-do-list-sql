require './lib/task'
require './lib/list'
require 'PG'

DB = PG.connect(:dbname => 'to_do')

puts 'Welcome to the To Do list!'


def main_menu
  puts "Press c to create new list"
  puts "Press v to view lists"
  puts "Press d to delete a list"
  puts "Press x to exit\n\n"
  main_choice = gets.chomp.downcase


  if main_choice == 'c'
    new_list
    main_menu
  elsif main_choice == 'x'
    system "clear"
    exit
  elsif main_choice == 'v'
    view_list
  elsif main_choice == 'd'
    delete_list
  else
    system "clear"
    main_menu
  end
end

def new_list
  puts "Enter name of your list: "
  list_name = gets.chomp
  name_of_users_list = List.new(list_name)
  name_of_users_list.save
  results = DB.exec("SELECT * FROM lists;")
  results.each do |result_obj|
    if list_name == result_obj['list_name']
      @current_list_id = result_obj['id']
    end
  end

  new_task
end

def delete_list
  puts "\n"
  system "clear"
  List.all.each do |list|
    puts list.list_name
  end

  puts "\nEnter the name of the list you wanna delete\n"
  name = gets.chomp
  List.all.each do |list|
    if name == list.list_name
        list.delete
      main_menu
    end
  end

end

def view_list
  puts "\n"
  system "clear"
  List.all.each do |list|
    puts list.list_name
  end
  puts "\n"
  puts "Enter name of list to view its tasks or exit to go back to main menu."
  list_choice = gets.chomp
  if list_choice == 'exit'
    system "clear"
    main_menu
  else
    List.all.each do |list|
      if list_choice == list.list_name
          list.select
        view_tasks
      end
    end
  end

end

def new_task
  puts "Enter name of the task to add: "
  puts "Enter exit to go back to main menu"
  task_name = gets.chomp
  if task_name == 'exit'
    system "clear"
    main_menu
  else
    name_of_users_task = Task.new(task_name, @current_list_id)
    name_of_users_task.save
    new_task
  end
end


def view_task


end


system "clear"
main_menu




