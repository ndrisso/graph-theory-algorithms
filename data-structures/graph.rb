class Graph
  attr_accessor :nodes, :edges

  def initialize(nodes, edges)
    self.nodes = nodes # amount
    self.edges = edges
  end

  def adjacency_list
    @adjacency_list ||= begin
      result = Hash.new { |h, k| h[k] = [] }
      (0...nodes).each_with_object(result) do |node, result|
        edges.each do |edge|
          result[node].push edge.endpoint_2 if edge.endpoint_1 == node
          result[node].push edge.endpoint_1 if edge.endpoint_2 == node
        end
      end
      result
    end
  end
end

class DirectedGraph < Graph
  def adjacency_list
    @adjacency_list ||= begin
      result = Hash.new { |h, k| h[k] = [] }
      (0...nodes).each_with_object(result) do |node, result|
        edges.each do |edge|
          result[node].push edge if edge.source == node
        end
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
