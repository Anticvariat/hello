# frozen_string_literal: true

require 'rails_helper'

describe Article do
  describe '.destroy' do
    let(:user) { create(:user) }
    let(:article) { build(:article) }

    context 'when article present' do
  	  it 'deletes article' do
  	  	article.save

  	  	expect{article.reload}.not_to raise_error
  	    expect{article.destroy}.to change(Article, :count).by(-1)
  	    expect{article.reload}.to raise_error(ActiveRecord::RecordNotFound)
  	  end
    end

    context 'when article not present' do
  	  it 'deletes article' do
  	  	
  	  	expect{article.reload}.to raise_error(ActiveRecord::RecordNotFound)
  	  	expect{article.destroy}.to change(Article, :count).by(0)
  	  end
    end

  end
end
