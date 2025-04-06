import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatImageFragment extends ConsumerWidget {
  final String imageUrl;

  const CatImageFragment({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: Image.network(
            imageUrl,
            height: 350.0,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(
                  Icons.broken_image,
                  size: 50.0,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
