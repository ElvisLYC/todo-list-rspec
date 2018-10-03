require "rspec"
require "rspec-given"
require_relative "list"
require_relative "task"

describe List do
  # Your specs here
  # specify pre-condition of test
    Given(:title) {"Study Rails"}
    Given(:list) {List.new(title)}
    Given(:task) {Task.new("Read more")}
    Given(:task2) {Task.new("Read more2")}
    Given(:task3) {Task.new("Read more3")}
    Given(:lists) {List.new(title, [task, task2, task3])}

    describe "#initialize" do
      context "create a new list with title" do
      # specify code to be executed ->   #create a new List
        When (:create_list){List.new(title)}
          #able to create task with title
        Then {expect(create_list).to be_a_kind_of(List)}
      end
      #raise argument error if no title
      context "requires one argument" do
        Then {expect{List.new}.to raise_error(ArgumentError)} # noticed we used {Task.new} instead of (Task.new)? With () is to test the return value, {} is to test the behavior
      end
    end

    describe "#add_task" do
      Given(:list) {List.new(title)}
      #add a task
      context "create a new task" do
        When {list.add_task(task)}
        #complete
        Then { list.tasks[0].description == "Read more"}
        # specify code to be executed
      end
      context "requires one argument" do
        Then {expect{list.add_task()}.to raise_error(ArgumentError)} # noticed we used {Task.new} instead of (Task.new)? With () is to test the return value, {} is to test the behavior
      end
    end

    describe "#complete_task" do
      context "returns true for complete tasks" do
        Given(:list) {List.new(title,[task])}
        When {list.complete_task(0)}
        Then {list.tasks[0].complete? == true}
      end
    end

      describe "#delete_task" do
        # Listing.new("study rails", []"read more"])
        # Given(:title) {"This is a list"}
        # Given(:task1) {Task.new('task1')}
        # Given(:task2) {Task.new('task 2')}
        # Given(:list) {List.new(title,[task1, task2])}
        Given(:arr_item){List.new(title, [task])}
          context "return true if task is deleted" do
            When (:delete_item){arr_item.delete_task(0)}
            Then {arr_item.tasks.length == 0 }
          end
        end

        describe "#completed_tasks" do
            context "return all completed task" do
              When {lists.complete_task(0)}
              When {lists.complete_task(1)}

              Then {lists.completed_tasks == [task, task2]}
            end
            context "raise if index does not exist" do
              # When {lists.complete_task(10)}
              Then {expect{lists.complete_task(10)}.to raise_error(StandardError)} # noticed we used {Task.new} instead of (Task.new)? With () is to test the return value, {} is to test the behavior
            end
          end

          describe "#incomplete_tasks" do
              context "return all incomplete task" do
                When {lists.complete_task(0)}
                When {lists.complete_task(1)}

                Then {lists.incomplete_tasks == [task3]}
              end
            end
  end
