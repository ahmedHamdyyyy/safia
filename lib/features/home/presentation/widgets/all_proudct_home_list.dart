import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/features/products/data/models/categories.dart';
import 'package:safiaa/features/products/presentation/widgets/product_card.dart';

class AllProudctHomeList extends StatelessWidget {
  const AllProudctHomeList({super.key, required this.product});
  final List<Products> product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: ListView.builder(
        clipBehavior: Clip.none,
        itemCount: product.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ProductsCard(
          products: product[index],
        ),
      ),
    );
  }
}
