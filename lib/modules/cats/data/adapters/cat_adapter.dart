import 'package:catbreeds/modules/cats/domain/entities/cat.dart';
import 'dart:convert';

class CatAdapter {
  static List<Cat> fromApiListModelToEntityModelList(String dataString) {
    final List<dynamic> jsonList = jsonDecode(dataString);
    final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(jsonList);

    return data.map<Cat>((cat) {
      return fromApiModelToEntityModel(cat);
    }).toList();
  }

  static Cat fromApiModelToEntityModel(Map<String, dynamic> data) {
    return Cat(
      id: data['id'],
      name: data['name'] ?? '',
      imageUrl: data['image'] != null
          ? data['image']['url']
          : 'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=',
      country: data['origin'] ?? '',
      description: data['description'] ?? '',
      wikipediaUrl: data['wikipedia_url'] ?? '',
      temperament: data['temperament'] ?? '',
      lifeSpan: data['life_span'] ?? '',
      intelligence: data['intelligence'] ?? 0,
      adaptability: data['adaptability'] ?? 0,
      energyLevel: data['energy_level'] ?? 0,
      affectionLevel: data['affection_level'] ?? 0,
      childFriendly: data['child_friendly'] ?? 0,
      catFriendly: data['cat_friendly'] ?? 0,
      dogFriendly: data['dog_friendly'] ?? 0,
      strangerFriendly: data['stranger_friendly'] ?? 0,
      grooming: data['grooming'] ?? 0,
      healthIssues: data['health_issues'] ?? 0,
      sheddingLevel: data['shedding_level'] ?? 0,
      socialNeeds: data['social_needs'] ?? 0,
      bidability: data['bidability'] ?? 0,
      hypoallergenic: data['hypoallergenic'] ?? 0,
    );
  }
}
