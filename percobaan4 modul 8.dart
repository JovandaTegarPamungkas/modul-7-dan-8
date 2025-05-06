import 'dart:io';

class DNode<T> {
  T nodeValue;  // Nilai data dari node
  DNode<T>? prev;  // Node sebelumnya
  DNode<T>? next;  // Node berikutnya

  // Constructor untuk membuat node baru dengan nilai tertentu
  DNode(this.nodeValue) : next = null, prev = null;
}

class DoubleLinkedList<T> {
  DNode<T>? head;  // Menandai node pertama
  DNode<T>? tail;  // Menandai node terakhir

  // Menambahkan node di depan
  void insertFront(T value) {
    DNode<T> newNode = DNode(value);

    if (head == null) {
      head = newNode;
      tail = newNode;  // Jika hanya ada satu node, head dan tail sama
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }

  // Menambahkan node di belakang
  void insertEnd(T value) {
    DNode<T> newNode = DNode(value);

    if (tail == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  // Method untuk mencetak list dari depan ke belakang (maju)
  void printList() {
    DNode<T>? currentNode = head;
    print("Traversing Maju (Dari Depan ke Belakang): ");
    while (currentNode != null) {
      stdout.write("${currentNode.nodeValue} ");
      currentNode = currentNode.next;
    }
    print("");

    // Method untuk mencetak list dari belakang ke depan (mundur)
    print("Traversing Mundur (Dari Belakang ke Depan): ");
    DNode<T>? currentTail = tail;
    while (currentTail != null) {
      stdout.write("${currentTail.nodeValue} ");
      currentTail = currentTail.prev;
    }
    print("");
  }
}

void main() {
  var dll = DoubleLinkedList<String>();

  dll.insertFront("Biru");
  dll.insertFront("Hijau");
  dll.insertEnd("Merah");

  dll.printList();  // Mencetak list dari depan ke belakang dan belakang ke depan
}
