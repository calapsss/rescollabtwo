require 'rails_helper'
include Warden::Test::Helpers
RSpec.describe "branches", :type => :request do

  shared_examples 'render_templates' do
    it 'renders a life template' do
      get '/posts/life'
      expect(response).to render_template(:life)
    end

    it 'renders a physics template' do
      get '/posts/physics'
      expect(response).to render_template(:physics)
    end

    it 'renders a applied template' do
      get '/posts/applied'
      expect(response).to render_template(:applied)
    end
  end

  context 'non-signed in user' do
    it_behaves_like 'render_templates'
  end

  context 'signed in user' do
    let(:user) { create(:user) }
    before(:each) { login_as user }

    it_behaves_like 'render_templates'
  end

end