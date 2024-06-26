import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favoriteMealsProvider.notifier);
            },
             icon: const Icon(Icons.star),
             )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
          meal.imageUrl,
          height: 299,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 15),
        Text('Ingredients',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        ),
         const SizedBox(height: 15),
        for(final ingredient in meal.ingredients)
          Text(ingredient, 
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
           ),
         ),
         const SizedBox(height: 24),
         Text(
          'Steps',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        ),
         const SizedBox(height: 15),
        for(final step in meal.steps)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 11,
              vertical: 7,
            ),
            child: Text(
              step,
              textAlign: TextAlign.center, 
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
             ),
                   ),
          ),
        ],
        ),
      ),
    );
  }

}