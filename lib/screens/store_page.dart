import 'package:flutter/material.dart';

import '../data/shoe_data.dart';
import '../models/shoe.dart';
import '../widgets/cart_item_tile.dart';
import '../widgets/shoe_card.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final List<CartItem> _cart = [];

  void _addToCart(Shoe shoe) {
    setState(() {
      final index = _cart.indexWhere((item) => item.shoe.id == shoe.id);
      if (index == -1) {
        _cart.add(CartItem(shoe: shoe));
      } else {
        _cart[index].quantity++;
      }
    });
  }

  void _removeFromCart(CartItem item) => setState(() => _cart.remove(item));

  double get _total => _cart.fold(0, (sum, item) => sum + item.total);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Giày hiệu', style: TextStyle(color: Colors.white, fontSize: 14)),
          backgroundColor: const Color(0xff079ee8),
          toolbarHeight: 40,
        ),
        body: ListView(padding: const EdgeInsets.fromLTRB(12, 8, 12, 16), children: [
          const Text('Giỏ hàng', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 6),
          if (_cart.isEmpty)
            const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Text('Giỏ hàng đang trống', style: TextStyle(color: Colors.black54)))
          else
            ..._cart.map((item) => CartItemTile(item: item, onRemove: () => _removeFromCart(item))),
          const SizedBox(height: 8),
          const Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Tổng tiền:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            Text('${_total.toStringAsFixed(2)}', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 13)),
          ]),
          const Divider(height: 30),
          const Text('Danh sách giày', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 7),
          SizedBox(height: 184, child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shoes.length,
            itemBuilder: (_, index) => ShoeCard(shoe: shoes[index], onAdd: () => _addToCart(shoes[index])),
          )),
        ]),
      );
}
