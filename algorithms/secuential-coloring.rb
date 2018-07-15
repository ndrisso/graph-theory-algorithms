class SecuentialColoring
  attr_reader :graph

  def initialize(graph)
    @graph = graph
  end

  # Prints a proper vertex coloring for the given graph
  def proper_coloring
    max_colors = graph.nodes - 1
    coloring = [max_colors] * max_colors
    (0...graph.nodes).each do |node|
      color = 0
      loop do
        if valid_color?(node, color, coloring)
          coloring[node] = color
          break
        end
        color += 1
      end
    end
    coloring
  end

  def valid_color?(node, color, coloring)
    graph.adjacency_list[node].each do |adjacent_node|
      return false if coloring[adjacent_node] == color
    end

    true
  end
end
