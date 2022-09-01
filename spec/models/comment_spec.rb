require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'with valid atributes' do
    let(:article) { build(:article)}
    let(:comment) { build(:comment) }

    it 'is valid' do
      expect(comment).to be_valid
    end
  end
end