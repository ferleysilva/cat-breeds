import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:catbreeds/modules/cats/domain/entities/cat.dart';
import 'package:catbreeds/modules/cats/presentation/fragments/cat_image_fragment.dart';
import 'package:catbreeds/modules/cats/presentation/fragments/span_value_text_fragment.dart';

class CatDetailScreen extends ConsumerWidget {
  final Cat cat;

  const CatDetailScreen({
    super.key,
    required this.cat,
  });

  Future<void> _launchUrl(BuildContext context, String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch URL')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = [
      {'label': 'Temperament', 'value': cat.temperament},
      {'label': 'Life Span', 'value': cat.lifeSpan},
      {'label': 'Intelligence', 'value': cat.intelligence.toString()},
      {'label': 'Adaptability', 'value': cat.adaptability.toString()},
      {'label': 'Energy Level', 'value': cat.energyLevel.toString()},
      {'label': 'Affection Level', 'value': cat.affectionLevel.toString()},
      {'label': 'Child Friendly', 'value': cat.childFriendly.toString()},
      {'label': 'Cat Friendly', 'value': cat.catFriendly.toString()},
      {'label': 'Dog Friendly', 'value': cat.dogFriendly.toString()},
      {'label': 'Stranger Friendly', 'value': cat.strangerFriendly.toString()},
      {'label': 'Grooming', 'value': cat.grooming.toString()},
      {'label': 'Health Issues', 'value': cat.healthIssues.toString()},
      {'label': 'Shedding Level', 'value': cat.sheddingLevel.toString()},
      {'label': 'Social Needs', 'value': cat.socialNeeds.toString()},
      {'label': 'Bidability', 'value': cat.bidability.toString()},
      {'label': 'Hypoallergenic', 'value': cat.hypoallergenic.toString()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CatImageFragment(imageUrl: cat.imageUrl),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cat.description,
                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 16),
                  SpanValueTextFragment(
                    label: 'Wikipedia Link',
                    value: cat.wikipediaUrl,
                    isLink: true,
                    onTap: () => _launchUrl(context, cat.wikipediaUrl),
                  ),
                  const SizedBox(height: 16),
                  ...details.map((detail) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: SpanValueTextFragment(
                          label: detail['label']!,
                          value: detail['value']!,
                        ),
                      )),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
