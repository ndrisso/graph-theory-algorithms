class Graph
  attr_accessor :nodes, :edges

  def initialize(nodes, edges)
    self.nodes = nodes
    self.edges = edges
  end

  def adjacency_list
    @adjacency_list ||= begin
      result = Hash.new { |h, k| h[k] = [] }
      nodes.each_with_object(result) do |node, result|
        edges.each do |edge|
          result[node].push edge if edge.origin == node
        end
      end
      result
    end
  end
end

Edge = Struct.new(:origin, :destiny, :weight)
