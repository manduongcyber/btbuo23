class Shoe {
  const Shoe({required this.id, required this.name, required this.price, required this.imageUrl});

  final String id;
  final String name;
  final double price;
  final String imageUrl;
}

class CartItem {
  CartItem({required this.shoe, this.quantity = 1});

  final Shoe shoe;
  int quantity;
  double get total => shoe.price * quantity;
}
