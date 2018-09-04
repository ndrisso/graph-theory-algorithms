class BellmanFord
  attr_accessor :graph, :source, :target

  def initialize(graph, source, target)
    self.graph = graph
    self.source = source
    self.target = target
  end

  def apply
    distances = []
    (0...graph.nodes).each { |node| distances[node] = Float::INFINITY }
    distances[source] = 0

    # Relax edges
    graph.nodes.times do
      graph.edges.each do |edge|
        if distances[edge.target] > distances[edge.source] + edge.weight
          distances[edge.target] = distances[edge.source] + edge.weight
        end
      end
    end

    # Check if there is a negative cycle
    graph.edges.each do |edge|
      if distances[edge.target] > distances[edge.source] + edge.weight
        raise 'Negative cycle found!'
      end
    end

    distances[target]
  end
end
