import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});

// the data here never changes. But if we want to use data that will change 
// over time, we can use StateNotifierProvider instead of Provider.