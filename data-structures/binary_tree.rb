class BinaryTree
  def initialize(root_value)
    @root = Node.new(root_value, nil, nil)
  end

  def insert(value)
    result = recursive_search(node: @root, value: value)
    raise "Already exists!" unless result[:node].nil?

    result[:parent][value < result[:parent].value ? :left_child : :right_child] = Node.new(value, nil, nil)
  end

  def remove(value)
    result = recursive_search(node: @root, value: value)
    raise "Not found #{value}" if result[:node].nil?

    if result[:node].left_child.nil? && result[:node].right_child.nil?
      # no childs, no problems
      result[:parent].value > result[:node].value ?
        result[:parent].left_child = nil : result[:parent].right_child = nil
    elsif result[:node].left_child.nil? ^ result[:node].right_child.nil?
      # node has only one child
      branch_to_connect = result[:node].left_child || result[:node].right_child

      result[:parent].value > result[:node].value ?
        result[:parent].left_child = branch_to_connect :
        result[:parent].right_child = branch_to_connect
    else
      # both childs are present
      min = find_min(node: result[:node].right_child, parent: result[:node])
      min[:parent][min[:parent].value < min[:node].value ? :right_child : :left_child] = min[:node].right_child
      result[:node].value = min[:node].value
    end
  end

  def find_min(node:, parent: nil)
    return { node: node, parent: parent } if node.left_child.nil?
    find_min(node: node.left_child, parent: node)
  end

  def find(value)
    !recursive_search(node: @root, value: value)[:node].nil?
  end

  # O(n) since it could be a degenerate tree
  def recursive_search(node:, parent: nil, value:)
    # If it doesn't exist return only the parent

    return { node: node, parent: parent } if node.value == value
    return { node: nil, parent: node } if (value < node.value && node.left_child.nil?) ||
      (value > node.value && node.right_child.nil?)

    next_node = value < node.value ? node.left_child : node.right_child
    recursive_search(node: next_node, parent: node, value: value)
  end
end

Node = Struct.new(:value, :left_child, :right_child)
