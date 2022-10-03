# frozen_string_literal: true

require 'rails_helper'

describe Comment do
  describe '.destroy' do
    let(:user) { create(:user) }
    let(:article) { create(:article) }

    context 'when comment present' do
      it 'deletes comment' do
      	comment = Comment.create(user: user, article: article, body: '12345')

      	expect{comment.destroy}.to change(Comment, :count).by(-1)
      	expect{comment.reload}.to raise_error(ActiveRecord::RecordNotFound)
  	  end
    end

    context 'when comment not present' do
      it 'deletes comment' do
      	comment = Comment.new()
      	
      	expect{comment.destroy}.to change(Comment, :count).by(0)
      	expect{comment.reload}.to raise_error(ActiveRecord::RecordNotFound)
  	  end
    end

  end
end