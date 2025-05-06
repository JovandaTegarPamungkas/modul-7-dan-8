class DNode<T> {
  T? nodeValue;
  DNode<T>? prev;
  DNode<T>? next;

  DNode() {
    nodeValue = null;
    next = this;
    prev = this;
  }

  DNode.withValue(T item) {
    nodeValue = item;
    next = this;
    prev = this;
  }
}

void main() {
  DNode<String> nodeKosong = DNode();             // Node kosong
  DNode<String> nodeIsi = DNode.withValue("red"); // Node dengan isi

  print("Node kosong: ${nodeKosong.nodeValue}"); // Output: null
  print("Node isi: ${nodeIsi.nodeValue}");       // Output: red
}
