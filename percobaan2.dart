class DNode<T> {
  T? nodeValue;
  DNode<T>? prev;
  DNode<T>? next;

  DNode() {
    nodeValue = null;
    next = this;
    prev = this;
  }

  DNode.withValue(this.nodeValue) {
    next = null;
    prev = null;
  }
}

class DoubleLinkedList<T> {
  DNode<T>? head;

  // Mengecek apakah list kosong
  bool isEmpty() => head == null;

  // Menambahkan node baru di depan (untuk pengujian)
  void insertFront(T value) {
    DNode<T> newNode = DNode.withValue(value);

    if (isEmpty()) {
      head = newNode;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }

void deleteFront() {
  if (!isEmpty()) {
    if (head!.next != null) {
      head = head!.next;
      head!.prev = null;
    } else {
      head = null;
    }
  }
}


void printList() {
  if (isEmpty()) {
    print("List kosong");
  } else {
    DNode<T>? current = head;
    while (current != null) {
      print(current.nodeValue);
      current = current.next;
    }
  }
}
}


void main() {
  var dll = DoubleLinkedList<String>();

  dll.insertFront("Biru");
  dll.insertFront("Hijau");
  dll.insertFront("Merah");

  print("Sebelum hapus:");
  dll.printList();

  dll.deleteFront(); // Hapus 'Merah'

  print("\nSetelah hapus depan:");
  dll.printList();
}
