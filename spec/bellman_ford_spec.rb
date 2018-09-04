require_relative '../algorithms/bellman_ford'
require_relative '../data-structures/graph'

RSpec.describe BellmanFord do
  context 'when a DAG is provided' do
    let(:graph) do
      edges = []
      edges.push(WeightedEdge.new(0, 1, 2))
      edges.push(WeightedEdge.new(1, 2, 5))
      edges.push(WeightedEdge.new(0, 2, 10))
      DirectedGraph.new(3, edges)
    end

    it 'returns the shortest path length' do
      expect(BellmanFord.new(graph, 0, 2).apply).to eq(7)
    end
  end

  context 'when a DAG with a negative cycle is provided' do
    let(:graph) do
      edges = []
      edges.push(WeightedEdge.new(0, 1, 2))
      edges.push(WeightedEdge.new(1, 2, -5))
      edges.push(WeightedEdge.new(2, 1, 1))
      edges.push(WeightedEdge.new(0, 2, 10))
      DirectedGraph.new(3, edges)
    end

    it 'raises an exception' do
      expect { BellmanFord.new(graph, 0, 2).apply }.to raise_error(RuntimeError)
    end
  end
end
