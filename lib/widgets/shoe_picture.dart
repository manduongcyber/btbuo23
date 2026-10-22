import 'package:flutter/material.dart';

class ShoePicture extends StatelessWidget {
  const ShoePicture({super.key, required this.imageUrl, this.fit = BoxFit.contain});
  final String imageUrl;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) => Image.network(
        imageUrl,
        fit: fit,
        errorBuilder: (_, __, ___) => Container(
          color: const Color(0xffeaf6fa),
          alignment: Alignment.center,
          child: const Icon(Icons.directions_run, size: 56, color: Colors.blue),
        ),
      );
}
