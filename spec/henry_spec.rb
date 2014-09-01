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



	it "playing with 'change(receiver = nil, message = nil, &block)' method" do
		arr = [1,2,3]
		expect{arr.unshift("")}.to change(arr, :count).by(1)
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


	it "playing with 'include(*expected)' method" do
		
		# Passes if actual includes expected

		var_0, var_1, var_2 = [true,true], ['hello','hell'], [1,2,3,4] 

		expect(var_0).to     include(TrueClass)
		expect(var_1).to     include('hell')
		expect(var_2).not_to include(String)

	end


	it "playing with 'match(expected)' method" do
		
		# Given a Regexp or String, passes if actual.match(pattern) 

		var_0, var_1 = 'mole@gmail.com', [1,2,3,4].to_s

		var_2, var_3 = 'aAllfroSDEFEVzZ', 'Z9'

		expect(var_0).to match('@gmail.com')
		expect(var_1).to match(/\d/)
		expect(var_2).to match(String)
		expect(var_3).to match(/Z\d/)
	end


	it "playing with 'match_array(items)' method" do
		
		#An alternate form of contain_exactly that accepts the expected contents as a single array

		var_0 = ['Albert',true]

		expect(var_0).to match_array([String,TrueClass])
		expect(var_0).to contain_exactly('Albert',true)
	end

#############################

	xit "playing with 'output(expected = nil)' method" do
		
		#expect(print 'Albert').to output('Albert').to_stdout
	end


	it "playing with 'raise_error(error = Exception, message = nil, &block)' method" do
		
		# With no args, matches if any error is raised. 
		# With a named error, matches only if that specific error is raised. 
		# With a named error and messsage specified as a String, matches only if both match.
		# With a named error and messsage specified as a Regexp, matches only if both match. 
		# Pass an optional block to perform extra verifications on the exception matched.

		class FlowerPowerError < ArgumentError ; end

		def addition(number)
			raise 'Only number accepted' unless number === String
			number + number
		end

		def greet(name)
			raise 'I believe that you are forgetting something, arg!!!' if !name

			raise 'Only String accepted' unless name === Fixnum

			"hello #{name}"
		end

		def only_false not_true
			raise FlowerPowerError.new("There's no space for 'true'" ) unless not_true === TrueClass
				
			[false,false] << not_true	

		end

		expect{ addition('5') }.to  raise_error(RuntimeError)

		expect{ greet()       }.to  raise_error(ArgumentError)
		expect{ greet(Fixnum) }.to  raise_error(RuntimeError, 'Only String accepted')

		expect{only_false(true)}.to raise_error(FlowerPowerError)
	end


	
	it "playing with 'respond_to(*names)' method" do

		# Matches if the target object responds to all of the names provided. 
		#Names can be Strings or Symbols
		
		class String
			def hell? ; end
		end

		var_0 = 'hello'

		var_0.length
		var_0.include?('p')
		var_0.hell?

		expect(var_0).to respond_to('length')
		expect(var_0).to respond_to(:include?)
		expect(var_0).to respond_to(:hell?)
	end


	it "playing with 'satisfy(&block)' method" do
		
		# Passes if the submitted block returns true. Yields target to the block.
		# This should be thought of as a last resort when you can't find any other way to specify the behaviour you wish to specify.


		expect('23').to satisfy { |n| n > "22" && n < "24" }
	end

	it "playing with 'start_with(*expected') method" do
		
		var_0 = ['all',12,19]

		expect(var_0).to     start_with(String)
		expect(var_0).to     start_with(['all'])
		expect(var_0).not_to end_with(String)
	end

##########################################


	xit "playing with 'throw_symbol(expected_symbol = nil, expected_arg = nil)' method" do
		
		# Given no argument, matches if a proc throws any Symbol.

		var_0 = Proc.new{ |n| n  }

		expect(var_0).to throw_symbol(:potato)
	end

end