class BellmanFord
  attr_accessor :graph, :source, :target

  def initialize(graph, source, target)
    self.graph = graph
    self.source = source
    self.target = target
  end

  def apply
    distances = []
    graph.nodes.each { |node| distances[node] = Float::INFINITY }
    distances[source] = 0

    # Relax edges
    graph.nodes.size.times do
      graph.edges.each do |edge|
        if distances[edge.target] > distances[edge.source] + edge.weight
          distances[edge.target] = distances[edge.source] + edge.weight
        end
      end
    end

    # Check if there is a negative cycle
    graph.edges.each do |edge|
      if distances[edge.target] > distances[edge.source] + edge.weight
        puts 'negative cycle found!'
        return -1
      end
    end

    distances[target]
  end
end
