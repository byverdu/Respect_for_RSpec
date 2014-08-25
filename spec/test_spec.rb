
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

		var_0, var_1, var_2 = (5>4), [false,false].include?(true), def method_name ;end

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
		expect(var_0).not_to     be_a_kind_of(Fixnum)    
	end

	it "playing with 'be_between(min,max)'" do
		
		# Works with any Comparable object --> String, Symbol, Time or Numeric
		# 'Inclusive' min and max by default, if desired append 'exclusive' at the end of the chain

		expect(2.3).to   be_between(1, 55) 
		expect(11 ).to   be_between(10,12).exclusive
		expect(9).not_to be_between(10,15)

	end
end