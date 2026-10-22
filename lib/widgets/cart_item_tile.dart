import 'package:flutter/material.dart';

import '../models/shoe.dart';
import 'shoe_picture.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({super.key, required this.item, required this.onRemove});
  final CartItem item;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 7),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xfff7f2f7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffe9dfe9)),
        ),
        child: Row(children: [
          SizedBox(width: 42, height: 42, child: ShoePicture(imageUrl: item.shoe.imageUrl)),
          const SizedBox(width: 8),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(item.shoe.name, maxLines: 1, overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
            Text('Giá: ${item.shoe.price.toStringAsFixed(1)} ',
                style: const TextStyle(color: Color(0xff20a84b), fontSize: 10)),
          ])),
          Text('Số lượng: ${item.quantity}', style: const TextStyle(color: Color(0xff008de0), fontSize: 10)),
          IconButton(onPressed: onRemove, visualDensity: VisualDensity.compact,
              icon: const Icon(Icons.delete, color: Colors.red, size: 19)),
        ]),
      );
}
