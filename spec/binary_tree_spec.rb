require_relative '../data-structures/binary_tree'
require 'pry'

RSpec.describe BinaryTree do
  context 'for a random tree' do
    let(:inserted_numbers) { (1..100).to_a.shuffle }
    let(:deleted_numbers) { inserted_numbers[1, 50] }

    let(:random_tree) do
      bt = BinaryTree.new(inserted_numbers.shift)
      inserted_numbers.each { |n| bt.insert(n) }
      deleted_numbers.each { |n| bt.remove(n) }
      bt
    end

    it 'contains exactly the values that it should have' do
      deleted_numbers.each { |n| expect(random_tree.find(n)).to be_falsey }
      (inserted_numbers - deleted_numbers).each { |n| expect(random_tree.find(n)).to be_truthy }
    end
  end
end
