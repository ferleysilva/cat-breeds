import 'package:catbreeds/modules/cats/domain/entities/cat.dart';
import 'package:catbreeds/modules/cats/presentation/screens/cat_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testCat = Cat(
    id: '1',
    name: 'Siamese',
    imageUrl: 'https://example.com/siamese.jpg',
    country: 'Thailand',
    description: 'A social and vocal breed.',
    wikipediaUrl: 'https://en.wikipedia.org/wiki/Siamese_cat',
    temperament: 'Active, Agile, Clever',
    lifeSpan: '15-20',
    intelligence: 5,
    adaptability: 5,
    energyLevel: 5,
    affectionLevel: 4,
    childFriendly: 3,
    catFriendly: 4,
    dogFriendly: 4,
    strangerFriendly: 5,
    grooming: 1,
    healthIssues: 2,
    sheddingLevel: 2,
    socialNeeds: 5,
    bidability: 3,
    hypoallergenic: 1,
  );

  testWidgets('CatDetailScreen renders correctly', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: CatDetailScreen(cat: testCat),
        ),
      ),
    );

    expect(find.text('Siamese'), findsOneWidget);
    expect(find.text('A social and vocal breed.'), findsOneWidget);
  });
}
