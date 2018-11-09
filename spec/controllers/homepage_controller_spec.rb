# frozen_string_literal: true

require 'rails_helper'

describe HomepageController do
  describe 'GET index' do
    it 'returns an http status code 200' do
      get :index

      expect(response).to have_http_status(200)
    end
  end
end
