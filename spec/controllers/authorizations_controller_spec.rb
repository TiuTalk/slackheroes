require 'rails_helper'

RSpec.describe AuthorizationsController, type: :controller do

  describe 'GET #authorize' do
    let(:request) do
      {
        'provider'=> 'slack',
        'credentials'=> {
          'token'=>'token',
          "expires"=>false
        },
        'extra'=> {
          'team_info'=> {
            'ok'=>true,
            'team'=> {
              'id'=>'T026M1A20',
              'name'=>'HE:labs',
              'domain'=>'helabs',
              'email_domain'=>'helabs.com.br',
              'icon'=> {
                'image_original'=>'https://amazonaws.com/slack-files2/avatars/680b08165e59f4e9304a_original.jpg'}
                }
             }
          }
      }
    end

    context 'with successful authorization' do
      before { controller.request.env['omniauth.auth'] = request }

      context 'with new team' do
        it 'create a new team' do
          expect{ get :authorize }.to change(Team, :count).by(1)
        end

        it 'redirects to the new team page' do
          get :authorize
          expect(response).to redirect_to(team_path(Team.last))
        end

        it 'fire job to import users from team' do
          expect(UsersImporterJob).to receive(:perform_later).with(kind_of(Team))
          get :authorize
        end

        it 'fire job to import emojis from team' do
          expect(CustomEmojiImporterJob).to receive(:perform_later).with(kind_of(Team))
          get :authorize
        end

        it 'returns flash message' do
          get :authorize
          expect(flash[:notice]).to eq 'Your team is authorized successfully. We are importing your team data. Check back this page in a few minutes.'
        end
      end

      context 'with existing team' do
        let!(:team) { create :team, slack_id: 'T026M1A20', domain: 'foobar' }

        it 'updates team' do
          expect{ get :authorize }.not_to change{ team.reload.domain }.from('foobar')
        end

        it 'redirects to team page' do
          get :authorize
          expect(response).to redirect_to(team_path(team))
        end

        it 'returns flash message' do
          get :authorize
          expect(flash[:notice]).to eq 'Your team was already authorized.'
        end
      end
    end
  end
end
