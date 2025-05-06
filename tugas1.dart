class DNode<T> {
  T data;
  DNode<T>? prev;
  DNode<T>? next;

  DNode(this.data);
}

class DoubleLinkedList<T> {
  DNode<T>? head;

  void tambahDepan(T data) {
    var newNode = DNode(data);
    if (head == null) {
      head = newNode;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }

  void tampil() {
    var current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  void tambahNode_Sebelum(DNode<T> newNode, DNode<T> target) {
    if (head == null || target == head) {
      newNode.next = head;
      if (head != null) {
        head!.prev = newNode;
      }
      head = newNode;
      return;
    }

    var current = head;
    while (current != null && current != target) {
      current = current.next;
    }

    if (current == null) {
      print("Target tidak ditemukan");
      return;
    }

    var sebelum = current.prev;
    newNode.next = current;
    newNode.prev = sebelum;
    if (sebelum != null) {
      sebelum.next = newNode;
    }
    current.prev = newNode;
  }

  DNode<T>? cariNode(T data) {
    var current = head;
    while (current != null) {
      if (current.data == data) return current;
      current = current.next;
    }
    return null;
  }
}

void main() {
  var list = DoubleLinkedList<String>();
  list.tambahDepan("C");
  list.tambahDepan("B");
  list.tambahDepan("A");

  print("Sebelum disisipkan:");
  list.tampil();

  var target = list.cariNode("B");
  if (target != null) {
    list.tambahNode_Sebelum(DNode("X"), target);
  }

  print("Setelah disisipkan sebelum B:");
  list.tampil();
}
