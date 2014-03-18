require 'spec_helper'

describe List do
  it 'is initialized with a name' do
    list = List.new('Epicodus stuff')
    list.should be_an_instance_of List
  end
  it 'tells you its name' do
    list = List.new('Epicodus stuff')
    list.list_name.should eq 'Epicodus stuff'
  end

  it 'starts with no list' do
    List.all.should eq []
  end

  it 'lets you save the list the database' do
    list = List.new('Epicodus stuff')
    list.save
    List.all.should eq [list]
  end

  it 'is the same list if it has the same name' do
    list1 = List.new('learn SQL')
    list2 = List.new('learn SQL')
    list1.should eq list2
  end

  it 'deletes a list from the database' do
    list = List.new('Epicodus stuff')
    list.save
    list.delete
    List.all.should eq []
  end

end
