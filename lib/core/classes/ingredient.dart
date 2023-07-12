import 'package:isar/isar.dart';

part 'ingredient.g.dart';

@collection
class Ingredient {
  Id id = Isar.autoIncrement;
  double? value;
  String? name;
  String? price;
  String? buyDate;

  Ingredient({
    this.value,
    this.name,
    this.buyDate,
  });
}
