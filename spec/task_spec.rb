require 'spec_helper'

describe Task do
  it 'is initialized with a name and list ID' do
    task = Task.new('learn SQL', 1)
    task.should be_an_instance_of Task
  end

  it 'tells you its name' do
    task = Task.new('learn SQL', 1)
    task.name.should eq 'learn SQL'
  end

  it 'tells you its list ID' do
    task = Task.new('learn SQL', 1)
    task.list_id.should eq 1
  end

  it 'starts with no tasks' do
    Task.all.should eq []
  end

  it 'lets you save the task the database' do
    task = Task.new('learn SQL', 1)
    task.save
    Task.all.should eq [task]
  end

  it 'is the same task if it has the same name' do
    task1 = Task.new('learn SQL', 1)
    task2 = Task.new('learn SQL', 1)
    task1.should eq task2
  end
end
