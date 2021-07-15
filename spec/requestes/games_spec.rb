require 'rails_helper'

describe 'Games API', type: :request do
    describe 'GET /games' do
        before do
            FactoryBot.create(:game, game_name: 'Skyrim' ,description: 'un jeu fantasique médieval' ,release: '2011-11-11', editor_id: '1', devloper_id: '1' )
            FactoryBot.create(:game, game_name: 'minecraft', description: 'un jeu bac a sable', release: '2011-11-11', editor_id: '1', devloper_id: '1')
        end

        it 'returns all games' do
            get '/api/v1/games'

            expect(response).to have_http_status(:success)
            expect(response_body.size).to eq(2)
        end 
    end

    describe 'POST /games' do
        before do
            FactoryBot.create()
        end

        it 'create a new game' do
            expect {
                post '/api/v1/games', params: { game: { 
                    game_name: 'Skyrim_test',
                    description: 'un jeu fantasique médieval',
                    release: '2011-11-11',
                    editor_id: '1',
                    devloper_id: '1',
                    platforms: [ "1", "2" ],
                    themes: ["1"],
                    genre: ["1"]
                    } 
                }
            }.to change { Game.count }.from(0).to(1)
            
            expect(response).to have_http_status(:created)
        end #EO expect
    end #EO post /game test

    describe 'DELETE /games/:id' do
        let!(:game) { FactoryBot.create(:game, id: '1', game_name: 'Skyrim' ,description: 'un jeu fantasique médieval' ,release: '2011-11-11' ) }

        it 'deletes a game' do
            expect {
                delete "/api/v1/games/#{game.id}"
            }.to change { Game.count }.from(1).to(0)

            expect(response).to have_http_status(:no_content)
        end
    end

end
