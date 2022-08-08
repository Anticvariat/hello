# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AllArticlesController, type: :controller do
  describe '#index' do
    it 'returns OK status' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
