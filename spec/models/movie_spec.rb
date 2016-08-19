require "rails_helper"
RSpec.describe Movie, :type => :model do

  it 'has one movie' do
  	Movie.create(title: 'Deadpool', rating: 'PG', total_gross: 1000)
	expect(Movie.count).to eq(1)
end
	
	it 'validate present of title' do
		movie = Movie.new(title: 'Super man',rating: 'PG',total_gross: 1000)
		expect(movie.valid?).to eq(true)
	end

	it 'not validate'  do
		movie = Movie.new(title: 'Super man',rating: 'PG')
		expect(movie.valid?).to eq(false)
	end

	it 'flop' do 
		movie = Movie.new(title: 'Super man',rating: 'PG',total_gross: 1000)
		expect(movie.flop?).to eq(true)		
	end

	it 'not flop' do 
		movie = Movie.new(title: 'Super man',rating: 'PG',total_gross: 1000000000000)
		expect(movie.flop?).to eq(false)	
	end	

	it 'is order by release on' do 
		movie1 = Movie.create(title: 'Deadpool', rating: 'PG', total_gross: 1000,release_on: '15/08/2016')
		movie2 = Movie.create(title: 'super man', rating: 'PG', total_gross: 1000,release_on:'14/08/2016')
		expect(Movie.released.last).to eq(movie1)
	end

	describe 'associate' do  		
		let(:movie){Movie.new(title: 'Deadpool', rating: 'PG', total_gross: 1000, release_on: '15/08/2016')}
		it 'create more movie' do 
			movie = Movie.create(title:'Iron man',rating: 'PG', total_gross: 2000, release_on: '15/08/2016')
			review = Review.create(name: 'test', stars: 3, comment: "show the movie", movie: movie) 
			expect(movie.reviews).to include(review) 
		end
	end

end