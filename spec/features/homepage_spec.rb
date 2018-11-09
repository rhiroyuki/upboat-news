# frozen_string_literal: true

require 'rails_helper'

describe 'homepage index' do
  it 'sees its content' do
    visit '/'

    expect(page).to have_content('hello world')
  end
end
