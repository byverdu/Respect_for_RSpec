
describe 'testing the rspec syntax' do

	it "playing with 'all' method" do

		arr, arr_2 = [1,13,15], ['dragon','dad']

		expect(arr).to all start_with(1)
		expect(arr).to all be_odd
		
		expect(arr_2).to all start_with('d')
		expect(arr_2).to all include('a')
	end
end