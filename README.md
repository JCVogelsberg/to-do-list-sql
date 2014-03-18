#Finishing the to do list

Follow along with the example of building a to do list. As you go, build a user interface. (If you're feeling adventurous, write your user interface using curses.) Here are the requirements for the project (finish one at a time):

Allow users to create tasks, list them out, and delete them.
Add the ability to have multiple lists. Create a List#tasks method that returns all the tasks in a particular list.
When you delete a list, make sure that all of the tasks in that list get deleted, too.
Let users mark tasks as done without deleting them, so that they can view all of their completed tasks later. (Retain the ability to delete tasks as well.)
Build a feature to let users enter a due date.
Sort tasks by their due date. Check out the PostgreSQL documentation on ORDER BY - let the database do the sorting, not Ruby.
Now, let users choose between sorting by soonest due, or latest due. Make class methods for these.
Give users the option to edit a task's description.
Here are a couple things to be aware of when you work with the pg gem:

All of the values returned from in PG::Results objects will be strings. It is up to you to convert them into the proper Ruby class.
Booleans are represented by 't' and 'f'.
The SQL equivalent of nil is NULL. If you are trying to perform an insert and need to leave a value out, you should pass in NULL, not nil.
