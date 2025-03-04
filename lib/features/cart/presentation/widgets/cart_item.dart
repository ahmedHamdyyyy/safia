import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';
import 'package:safiaa/features/cart/data/models/cart_model.dart';
import 'package:safiaa/features/cart/presentation/cubit/cubit/cart_cubit.dart';

class CartItem extends StatefulWidget {
  final Items items;

  const CartItem({
    super.key,
    required this.items,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 211, 14, 0),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: MyColors.prime),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      onDismissed: (direction) {
        BlocProvider.of<CartCubit>(context).removeItemFromCart(
          widget.items.id!,
        );
        context.read<CartCubit>().fetchCartItems();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: MyColors.prime),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.items.image.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.items.title.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getBoldStyle(
                      color: MyColors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${widget.items.price} ريال',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getSemiBoldStyle(
                      color: MyColors.grayscale300,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, size: 20),
                  onPressed: () {
                    context.read<CartCubit>().addItemToCart(
                        widget.items.id!, widget.items.quantity! - 1);
                    context.read<CartCubit>().fetchCartItems();
                  },
                ),
                Text(
                  widget.items.quantity.toString(),
                   maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getBoldStyle(
                      color: MyColors.black,
                      fontSize: 14.sp,
                    ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, size: 20),
                  onPressed: () {
                    context.read<CartCubit>().addItemToCart(
                        widget.items.id!, widget.items.quantity! + 1);

                    context.read<CartCubit>().fetchCartItems();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
