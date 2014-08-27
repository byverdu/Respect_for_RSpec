
describe 'testing the rspec syntax' do

	it "playing with 'all' method" do

		# Passes if all elements agrees the expectation

		var_0, var_1 = [1,13,15], ['dragon','dad']

		expect(var_0).to all start_with(1)
		expect(var_0).to all be_odd
		
		expect(var_1).to all start_with('d')
		expect(var_1).to all include('a')
	end


	it "playing with 'be' method" do

		# Test for boolean values

		var_0, var_1, var_2 = (5>4), [false,false].include?(true), def method_name ; end

		var_3, var_4, var_5 = 'String', [], 69

									var_6 = ['FYI','BTW']
			
		expect(var_0).to be true  #--> be_truthy
		expect(var_1).to be false #--> be_falsey
		expect(var_2).to be nil   #--> be_nil
		
		expect(var_3).to be_instance_of(String) # be_[arbitrary_predicate](*args)
		expect(var_4).to be_empty

		expect(var_5).not_to be nil
		expect(var_6).not_to be_include('LOL')
	end


	it "playing with 'be_a(Klass)' method" do
		
		# Test for --> target.kind_of?(Klass)

		class Dog ; end

		var_0, var_1, var_2 = 888, (1 < 2), Dog.new

		expect(var_0).to be_a(Fixnum) 
		expect(var_1).to be_a(TrueClass)
		expect(var_2).to be_a(Dog)
	end

	
	it "playing with 'be_a_kind_of(expected)' method" do
		
		# Passes if actual.kind_of?(expected)

		var_0, var_1 = String, 'some String'

		expect('some String').to be_a_kind_of(var_0)
		expect(var_1).to         be_a_kind_of(String)
		expect(var_1).not_to     be_a_kind_of(Fixnum)   

		# Is also possible use 'be_an_instance_of(expected)' 
	end

	
	it "playing with 'be_between(min,max)' method" do
		
		# Works with any Comparable object --> String, Symbol, Time or Numeric
		# 'Inclusive' min and max by default, if desired append 'exclusive' at the end of the chain

		expect(2.3).to   be_between(1, 55) 
		expect(11 ).to   be_between(10,12).exclusive
		expect(9).not_to be_between(10,15)
	end

	
	it "playing with 'be_within' method" do
		
		var = 8*8

		expect(6).to   be_within(3.4).of(8)
		expect(var).to be_within(60).of(66)
	end


	xit "playing with 'change(receiver = nil, message = nil, &block)' method" do
		
		# Applied to a proc, specifies that its execution will cause some value to change.
		# You can either pass receiver and message, or a block(use '{}'), but not both. 

	end


	it "playing with 'contain_exactly(*items)' method" do
		
		# Passes if actual collections contains all of the expected regardless of order. 

		var_0, var_1 = ['Albert',34], ['Superman']

		expect(var_0).to  contain_exactly(String,Fixnum)
		expect(var_1).to  contain_exactly('Superman')
	end


	it "playing with 'cover(*values)' method" do
		
		# Passes if actual covers expected. This works for Ranges

		expect(1..10).to     cover(5)
		expect(1..10).to     cover(4, 6)
		expect(1..10).not_to cover(11)
	end


	it "playing with 'end_with(*expected)' method" do
		
		# Used for collections and strings

		expect(['lol','aka']).to end_with(['aka'])

		expect("hello").to       end_with('ello')

		expect([1,2,['lol']]).to end_with([])

		expect([34,true]).to     end_with(true)

		expect([{name: 'Charlie'},{name: 'Albert'}]).to end_with([{name: 'Albert'}])
	end

	it "playing with 'eq(expected)--eql(expected)--equal(expected)' method" do

		# (eq)    Passes if actual == expected.     -->  At the Object level, == returns true only if obj and other are the same object. 
		# (eql)   Passes if actual.eql?(expected)   -->  Returns true if obj and other refer to the same hash key.
		# (equal) Passes if actual.equal?(expected) -->  Should never be overridden by subclasses as it is used to determine object identity 
		
		

		var_0, var_1 = 25, 'frog'

		expect(var_0).to eq 25
		expect(var_0).to eql 25
		expect(var_0).to equal 25

		expect(var_1).to eq 'frog'
		#expect(var_1).to equal 'frog' --> Error, no same identity object
	end


	it "playing with 'exist(*args)' method" do
		
		# Passes if actual.exist? or actual.exists? --> Only works for file_names

		expect(File).to exist("./spec/test_spec.rb") # --> exist("./spec/test_spec") gives error
		#expect(File).to exist("./spec/.rspec") # --> Error

	end
end