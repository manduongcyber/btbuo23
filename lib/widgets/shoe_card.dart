import 'package:flutter/material.dart';

import '../models/shoe.dart';
import 'shoe_picture.dart';

class ShoeCard extends StatelessWidget {
  const ShoeCard({super.key, required this.shoe, required this.onAdd});
  final Shoe shoe;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) => Container(
        width: 150,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: const Color(0xfff7f2f7), borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xffeee4ed))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: Center(child: ShoePicture(imageUrl: shoe.imageUrl))),
          Text(shoe.name, maxLines: 1, overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
          Text('${shoe.price.toStringAsFixed(1)}', style: const TextStyle(fontSize: 10)),
          const SizedBox(height: 6),
          Center(child: FilledButton(
            onPressed: onAdd,
            style: FilledButton.styleFrom(minimumSize: const Size(100, 30), padding: const EdgeInsets.symmetric(horizontal: 12),
                textStyle: const TextStyle(fontSize: 10)),
            child: const Text('Thêm vào giỏ'),
          )),
        ]),
      );
}
