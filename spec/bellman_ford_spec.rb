require_relative '../algorithms/bellman_ford'
require_relative '../data-structures/graph'

RSpec.describe BellmanFord do
  context 'when a DAG is provided' do
    let(:graph_1) do
      edges = []
      edges.push(Edge.new(1, 2, 2))
      edges.push(Edge.new(2, 3, 5))
      edges.push(Edge.new(1, 3, 10))
      nodes = [1, 2, 3]
      Graph.new(nodes, edges)
    end

    it 'returns the shortest path length' do
      expect(BellmanFord.new(graph_1, 1, 3).apply).to eq(7)
    end
  end
end
