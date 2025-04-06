import 'package:catbreeds/modules/cats/domain/entities/cat.dart';
import 'package:catbreeds/modules/cats/presentation/fragments/cat_image_fragment.dart';
import 'package:catbreeds/modules/cats/presentation/fragments/span_value_text_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatCardFragment extends ConsumerWidget {
  final Cat catData;
  final VoidCallback? onTap;

  const CatCardFragment({super.key, required this.catData, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    catData.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: onTap,
                    child: const Text(
                      'View More',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              CatImageFragment(imageUrl: catData.imageUrl),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SpanValueTextFragment(
                    label: 'Country',
                    value: catData.country,
                  ),
                  SpanValueTextFragment(
                    label: 'Intelligence',
                    value: catData.intelligence.toString(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
