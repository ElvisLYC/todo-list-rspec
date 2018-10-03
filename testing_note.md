1. specify pre-condition for the test
  -> let is used for rspec and Given is used for rspec-given

2. specify code to be executed
  ->code to be executed passed as argument to expect in rspec while
    When is used in rspec-given  
3. compare results for executed code with hardcoded expected results
  ->.to eq is used when using rspec the equivalent being Then when using rspec-given

rspec-expectations includes two matchers to specify types of objects:

  -expect(obj).to be_kind_of(type): calls obj.kind_of?(type),   which returns true if type is in obj's class hierarchy or is a module and is included in a class in obj's class hierarchy.

  -expect(obj).to be_instance_of(type): calls obj.instance_of?(type), which returns true if and only if type if obj's class.
