class BinaryTree
  def initialize(root_value)
    @root = Node.new(root_value, nil, nil)
  end

  def insert(value)
    node = recursive_search(@root, value)
    raise "Already exists!" if node.value == value

    node[value < node.value ? :left_child : :right_child] = Node.new(value, nil, nil)
  end

  def remove(value)
    
  end

  def find(value)
    recursive_search(@root, value).value == value
  end

  # O(n) since it could be a degenerate tree
  def recursive_search(node, value)
    # If it is the correct value then return the node, also if it doesn't exist
    # return the current node (which would be his parent)
    if node.value == value || (value < node.value && node.left_child == nil) ||
      (value > node.value && node.right_child == nil)
      return node
    end

    recursive_search(value < node.value ? node.left_child : node.right_child, value)
  end
end

Node = Struct.new(:value, :left_child, :right_child)
