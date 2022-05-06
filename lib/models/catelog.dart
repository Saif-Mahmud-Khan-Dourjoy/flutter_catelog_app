class CatelogModel {
  static final items = [
    Item(
        id: 1,
        name: "iPhone 13 max",
        desc: "Apple is Apple",
        price: 999,
        color: "#63c884",
        image:
            "data:image/jpeg;base64,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")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
