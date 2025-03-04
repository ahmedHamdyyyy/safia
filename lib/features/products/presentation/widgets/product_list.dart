import 'package:flutter/material.dart';
import 'package:safiaa/features/products/data/models/categories.dart';

import 'package:safiaa/features/products/presentation/widgets/product_card.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.categories, });
  final Categories categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:categories.products!.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
          bottom: 8.0,
        ),
        child: Container(),
      ),
    );
  }
}
