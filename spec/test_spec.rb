
describe 'testing the rspec syntax' do

	it "playing with 'all' method" do

		# Passes if all elements agrees the expectation

		arr, arr_2 = [1,13,15], ['dragon','dad']

		expect(arr).to all start_with(1)
		expect(arr).to all be_odd
		
		expect(arr_2).to all start_with('d')
		expect(arr_2).to all include('a')
	end


	it "playing with 'be' method" do

		# Test for boolean values

		var_0, var_1, var_2 = (5>4), [false,false].include?(true), def method_name ;end

		var_3, var_4, var_5 = 'String', [], 69

									var_6 = ['FYI','BTW']
			
		expect(var_0).to be true
		expect(var_1).to be false
		expect(var_2).to be nil
		
		expect(var_3).to be_instance_of(String) # be_[arbitrary_predicate](*args)
		expect(var_4).to be_empty

		expect(var_5).not_to be nil
		expect(var_6).not_to be_include('LOL')
		
	end
end