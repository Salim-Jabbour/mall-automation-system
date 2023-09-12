import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jessy_mall/core/widgets/custom_counter.dart';
import 'package:jessy_mall/featuers/cart/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:jessy_mall/featuers/cart/presentation/pages/my_cart.dart';

import '../../../Auth/presintation/bloc/auth_bloc.dart';

// ignore: must_be_immutable
class CartCard extends StatelessWidget {
  String? price;
  bool delete;
  String? name;
  String? image;
  int? id;
  String? quantity;
  CartCard({
    Key? key,
    this.price,
    required this.delete,
    this.name,
    this.image,
    this.id,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
      child: SizedBox(
        height: 300.h,
        width: 20.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: 30),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    height: 250.h,
                    width: 250.w,
                    color: Colors.black, //TODO commint color
                    child: Image.network(image ?? ""),
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? "product name",
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  price ?? "",
                  style: TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 16,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 55.h,
                ),
                Text(
                  "quantity: $quantity",
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Counter(
                //   x: 1,
                // )
              ],
            ),
            const Spacer(),
            delete
                ? IconButton(
                    icon: Icon(Icons.highlight_remove_outlined),
                    onPressed: () {
                      context.read<CartBloc>().add(CartRemoveOrderFromCartEvent(
                          token: context.read<AuthBloc>().token ?? '',
                          id: id!));
                      // Navigator.pushReplacement(
                      //   context,       //not work
                      //   MaterialPageRoute<void>(
                      //     builder: (BuildContext context) => const MyCartPage(),
                      //   ),
                      // );
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
