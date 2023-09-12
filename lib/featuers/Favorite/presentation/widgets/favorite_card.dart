import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/config/theme/color_manager.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/Favorite/presentation/BLoC/favorite/favorite_bloc.dart';
import 'package:jessy_mall/featuers/Favorite/presentation/widgets/favorite_body.dart';

import '../../models/favorite_model.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    required this.favoriteDataResponse,
    super.key,
  });
  final FavoriteDataResponse? favoriteDataResponse;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: 20.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 80.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0.r),
              child: Container(
                height: 250.h,
                width: 250.w,
                color: Colors.black,
                child: favoriteDataResponse?.image == null ||
                        favoriteDataResponse == null
                    ? const SizedBox.shrink()
                    : Image.network(
                        favoriteDataResponse!.image!,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.low,
                      ),
                // : Image.network("https://i.ytimg.com/vi/ekzHIouo8Q4/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLBR51nWW14U5t2BfAHxbuBPDhKSTQ")
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                favoriteDataResponse?.name ?? 'product X',
                style: TextStyle(
                  color: ColorManager.grey,
                  fontSize: 40.sp,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${favoriteDataResponse?.price ?? 'no price'} ',
                style: TextStyle(
                  color: ColorManager.black,
                  fontSize: 45.sp,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.highlight_remove_outlined),
                onPressed: () {
                  context.read<FavoriteBloc>().add(
                      FavoriteRemoveFavoriteProductsEvent(
                          token: context.read<AuthBloc>().token ?? "",
                          id: favoriteDataResponse?.id ?? 0));
                },
              ),
              // Expanded(child: SizedBox()),
              // Icon(Icons.shopping_bag),
              // SizedBox(
              //   height: 100.h,
              // ),
              // const Icon(Icons.shopify),
            ],
          )
        ],
      ),
    );
  }
}
