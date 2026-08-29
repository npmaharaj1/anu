/**
 * INVARIANT: the values stored in all descendants on the left are <= v
 *            the values stored in all descendants on the right are >= v
*/
class BST {

  BST(int v, BST l, BST r) {
    value  = v;
    left = l;
    right = r;
  }

  int value;
  BST left;
  BST right;
}

BST insert(BST tree, int element) {
  if (tree == null) {
    return new BST(element, null, null);
  } else if (element > tree.value) {
    return new BST(tree.value, tree.left, new BST(element, null, null));
  } else if (element < tree.value) {
    return new BST(tree.value, new BST(element, null, null), tree.right);
  } else {
    return new BST(element, tree.left, tree.right);
  }
}

boolean contains(BST haystack, int needle) {
  if (haystack == null) {
    return false;
  } else if (needle > haystack.value) {
    return contains(haystack.right, needle);
  } else if (needle < haystack.value) {
    return contains(haystack.left, needle);
  } else {
    return true;
  }
}

void main() {
  BST node = insert(insert(null, 1), 2);

  IO.println(node.right.value);
}
