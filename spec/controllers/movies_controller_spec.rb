require 'rails_helper'


RSpec.describe MoviesController, type: :controller do
  describe 'searching TMDb' do
    before :each do
      @fake_results = [double('movie1'), double('movie2')]
    end
    it 'calls the model method that performs TMDb search' do
      expect(Tmdb::Movie).to receive(:find).with('hardware').
        and_return(@fake_results)
      post :search_tmdb, params: {:search_terms => 'hardware'}
    end

    describe 'after valid search' do
      before :each do
        allow(Tmdb::Movie).to receive(:find).with('hardware').
        and_return(@fake_results)
        post :search_tmdb, params: {:search_terms => 'hardware'}
      end
      it 'selects the Search Results template for rendering' do
        expect(response).to render_template('show_tmdb')
      end
      it 'makes the TMDb search results available to that template' do
        expect(assigns(:search)).to eq(@fake_results)
      end
    end
  end

  describe 'create movie' do
    before :each do
      get :new
    end
    it 'selects the new movie template for rendering' do
      expect(response).to render_template('new')
    end
    it 'create new movie' do
      post :create, params: {
        movie: {:title => 'Batman',
                  :rating => 'PG',
                  :release_date => '15-Jan-2012',
                  :description => 'Hero from the dark'
              }
      }
    end

  describe ' movie' do
    before :each do
      post :create, params: {
        movie: {:title => 'Batman',
                  :rating => 'PG',
                  :release_date => '2012-01-15',
                  :description => 'Hero from the dark'
              }
      }
    end
    it 'selects the show movie template for rendering' do
      expect(response).to redirect_to(:action => 'show', :id => 1)
    end
    it 'makes the new movie result available on that template' do
      expect(assigns(:movie)).to have_attributes(
        :title => 'Batman',
        :rating => 'PG',
        :release_date => DateTime.parse('2012-01-15'),
        :description => 'Hero from the dark'
      )
    end


  end
end

end