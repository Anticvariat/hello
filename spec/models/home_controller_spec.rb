# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AllArticlesController, type: :controller do
  describe '#index' do
    it 'is valid' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end