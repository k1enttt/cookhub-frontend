class BeginningModel {
  const BeginningModel({
    required this.allergiesList,
    required this.dietariesList,
    required this.ingredientsList,
  });

  final List<Map<String, String>> allergiesList;
  final List<Map<String, String>> dietariesList;
  final List<Map<String, String>> ingredientsList;
}
