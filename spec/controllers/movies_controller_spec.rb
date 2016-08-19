require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
	describe "GET #index" do
		let(:movie1)  { Movie.create(title: 'bat man', rating: 'PG',
		 total_gross: '4635', release_on: '16/08/2016') }
		let(:movie2) { Movie.create(title: 'hero man', rating: 'PG', 
			total_gross: '4636', release_on: '16/08/2016') }
	before do
		process :index, method: :get
	end  
		it "responds successfully with an HTTP 200 status code" do
			# expect(response).to be_success	
			expect(response).to have_http_status(200)
		end 

		it "render the index template" do
			expect(response).to render_template("index")		
		end 

		it "load all of the post into @posts" do 
			expect(assigns(:movies)).to match_array([movie1,movie2])
		end
	end

	describe "GET #show" do
		let!(:movie) { Movie.create(title: 'bat man', rating: 'PG',
		 total_gross: '4635', release_on: '16/08/2016')}
		before do
			process :show, method: :get, params: { id: movie.id }
		end
		it "responds successfully with an HTTP 200 status code" do 
			expect(response).to be_success 
		end

		it "render the show template" do 
			expect(response).to render_template("show")
		end

	end
	
	describe "GET #edit" do 
		let!(:movie){Movie.create(title: "Super man", rating: "PG", 
			total_gross:'2445', release_on: "17/08/2016")}
			before do
				process :edit, method: :get, params: {id: movie.id}
			end
			it "rsponds successfully with an HTTP 200 status code" do 
				expect(response). to be_success
			end

			it "render the edit template" do
				expect(response).to render_template("edit")
			end
	end

	describe "GET #update" do
		let!(:movie){Movie.create(title: "Super man", rating: "PG", 
			total_gross: 2445, release_on: "17/08/2016")}
		before do 
			process :update, mthod: :put, params: { id: movie.id, 
				movie: { title: "Bat man", rating: "PG", total_gross: 3456, 
					release_on: "17/08/2016" } }
		end
		it "responds successfully with an HTTP 200 status code" do 
			# expect(response).to be_success
			expect(response).to have_http_status(302)
		end
	end

	describe "GET #create" do
		let!(:movie){Movie.create(title: "Super man", rating: "PG", 
			total_gross: 2445, release_on: "17/08/2016")}
		before do
			process :create, method: :get, params: { id: movie.id, 
				movie: { title: "Bat man", rating: "PG", total_gross: 3456, 
					release_on: "17/08/2016" } }
		end 

        it { expect(response).to have_http_status(302) }
	end

	describe ("GET #new") do 
		let!(:movie){Movie.create(title: "Super man", rating: "PG", 
			total_gross: 2445, release_on: "17/08/2016")}
		before do
			process :new, method: :get
		end

		it { expect(response).to be_success } 
	end

	describe ("GET #destroy") do 
		let!(:movie){Movie.create(title: "Super man", rating: "PG", 
			total_gross: 2445, release_on: "17/08/2016")}
		before do
			process :destroy, method: :delete, params: {id: movie.id}
		end
		it "responds successfully with an HTTP 200 status code" do
		 	
			expect(response).to have_http_status(302)
		end 
	end



end
