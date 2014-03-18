require 'pg'

class List
  attr_reader :list_name

  def initialize(list_name)
    @list_name = list_name
  end

  def save
    DB.exec("INSERT INTO lists (list_name) VALUES ('#{@list_name}');")
  end

  def delete
    DB.exec("DELETE FROM lists WHERE list_name = '#{list_name}';")
  end

  def self.all
    results = DB.exec("SELECT * FROM lists;")
    lists = []
    results.each do |result|
      list_name = result['list_name']
      lists << List.new(list_name)
    end
    lists
  end

  def ==(another_list)
    self.list_name == another_list.list_name
  end

end
