class Graph
  attr_accessor :nodes, :edges

  def initialize(nodes, edges)
    self.nodes = nodes # amount
    self.edges = edges
  end
end

class DirectedGraph < Graph
  def adjacency_list
    @adjacency_list ||= begin
      result = Hash.new { |h, k| h[k] = [] }
      (0...nodes).each do |node|
        edges.each { |e| result[node] << e if e.source == node }
      end
      result
    end
  end
end

class Edge
  attr_reader :endpoint_1, :endpoint_2

  def initialize(endpoint_1, endpoint_2)
    @endpoint_1 = endpoint_1
    @endpoint_2 = endpoint_2
  end

  alias_method :source, :endpoint_1
  alias_method :target, :endpoint_2
end

class WeightedEdge < Edge
  attr_reader :weight

  def initialize(endpoint_1, endpoint_2, weight)
    @weight = weight
    super(endpoint_1, endpoint_2)
  end
end
