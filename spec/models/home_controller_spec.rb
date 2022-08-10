# frozen_string_literal: true

require 'rails_helper'

RSpec.describe all_articles_controller_spec.rb, type: :controller do
  describe '#index' do
    it 'returns OK status' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
