import 'package:catbreeds/modules/cats/data/adapters/cat_adapter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CatAdapter', () {
    test('fromApiModelToEntityModel returns a Cat entity with correct values', () {
      final json = {
        'id': 'abc123',
        'name': 'Abyssinian',
        'image': {'url': 'https://cat.com/image.jpg'},
        'origin': 'Egypt',
        'description': 'A playful and active cat.',
        'wikipedia_url': 'https://en.wikipedia.org/wiki/Abyssinian_(cat)',
        'temperament': 'Active, Energetic, Independent',
        'life_span': '14 - 15',
        'intelligence': 5,
        'adaptability': 4,
        'energy_level': 5,
        'affection_level': 4,
        'child_friendly': 3,
        'cat_friendly': 4,
        'dog_friendly': 4,
        'stranger_friendly': 3,
        'grooming': 1,
        'health_issues': 2,
        'shedding_level': 2,
        'social_needs': 4,
        'bidability': 3,
        'hypoallergenic': 0,
      };

      final cat = CatAdapter.fromApiModelToEntityModel(json);

      expect(cat.id, 'abc123');
      expect(cat.name, 'Abyssinian');
      expect(cat.imageUrl, 'https://cat.com/image.jpg');
      expect(cat.country, 'Egypt');
      expect(cat.intelligence, 5);
      expect(cat.grooming, 1);
    });

    test('fromApiListModelToEntityModelList returns a list of Cat entities', () {
      const jsonString = '''
      [
        {
          "id": "cat1",
          "name": "Cat One",
          "image": {"url": "https://cat1.jpg"},
          "origin": "USA",
          "description": "Desc 1",
          "wikipedia_url": "http://wiki.com/cat1",
          "temperament": "Calm",
          "life_span": "10",
          "intelligence": 3,
          "adaptability": 4,
          "energy_level": 2,
          "affection_level": 3,
          "child_friendly": 2,
          "cat_friendly": 3,
          "dog_friendly": 2,
          "stranger_friendly": 1,
          "grooming": 1,
          "health_issues": 2,
          "shedding_level": 2,
          "social_needs": 3,
          "bidability": 3,
          "hypoallergenic": 1
        },
        {
          "id": "cat2",
          "name": "Cat Two",
          "image": null,
          "origin": "UK",
          "description": "Desc 2",
          "wikipedia_url": null,
          "temperament": "Friendly",
          "life_span": "12",
          "intelligence": null,
          "adaptability": null,
          "energy_level": null,
          "affection_level": null,
          "child_friendly": null,
          "cat_friendly": null,
          "dog_friendly": null,
          "stranger_friendly": null,
          "grooming": null,
          "health_issues": null,
          "shedding_level": null,
          "social_needs": null,
          "bidability": null,
          "hypoallergenic": null
        }
      ]
      ''';

      final cats = CatAdapter.fromApiListModelToEntityModelList(jsonString);

      expect(cats.length, 2);
      expect(cats[0].name, 'Cat One');
      expect(cats[1].name, 'Cat Two');
      expect(cats[1].imageUrl.contains('istockphoto'), isTrue);
      expect(cats[1].intelligence, 0);
    });
  });
}
