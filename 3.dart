class Node {
  String data;
  Node? next;

  Node(this.data);
}

class SingleLinkedList {
  Node? head;

  void tambahData(String dataBaru) {
    Node nodeBaru = Node(dataBaru);

    if (head == null) {
      head = nodeBaru;
    } else {
      Node? sekarang = head;

      while (sekarang!.next != null) {
        sekarang = sekarang.next;
      }

      sekarang.next = nodeBaru;
    }
  }

  void tampilkanData() {
    Node? sekarang = head;

    print("Isi Linked List:");
    while (sekarang != null) {
      print("- ${sekarang.data}");
      sekarang = sekarang.next;
    }
  }
}

void main() {
  SingleLinkedList listWarna = SingleLinkedList();

  listWarna.tambahData("Merah");
  listWarna.tambahData("Hijau");
  listWarna.tambahData("Biru");

  listWarna.tampilkanData();
}
