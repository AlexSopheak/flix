require 'rails_helper'
RSpec.describe ReviewsController, type: :controller do
	
		describe 'index views' do 
			it 'display the view with only title' do 
				visit movies_path 
				expect(page).to have_content'movie'
			end
		end
end
