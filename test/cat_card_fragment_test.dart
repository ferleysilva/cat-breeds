import 'package:catbreeds/modules/cats/domain/entities/cat.dart';
import 'package:catbreeds/modules/cats/presentation/fragments/cat_card_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders cat name and view more button', (WidgetTester tester) async {
    var cat = Cat(
      id: '1',
      name: 'Abyssinian',
      imageUrl: 'https://fakeimage.com/cat.jpg',
      country: 'Egypt',
      description: 'Friendly and active',
      wikipediaUrl: '',
      temperament: 'Active, Energetic',
      lifeSpan: '14 - 15',
      intelligence: 5,
      adaptability: 4,
      energyLevel: 5,
      affectionLevel: 4,
      childFriendly: 3,
      catFriendly: 4,
      dogFriendly: 4,
      strangerFriendly: 4,
      grooming: 1,
      healthIssues: 2,
      sheddingLevel: 2,
      socialNeeds: 4,
      bidability: 3,
      hypoallergenic: 0,
    );

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: CatCardFragment(
              catData: cat,
              onTap: () {},
            ),
          ),
        ),
      ),
    );

    expect(find.text('Abyssinian'), findsOneWidget);
    expect(find.text('View More'), findsOneWidget);
  });
}
