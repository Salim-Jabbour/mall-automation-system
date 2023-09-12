import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/color_manager.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    required this.imageNetworkSource,
    required this.storeName,
    required this.openAndCloseTime,
    // required this.subCategoryList,
    super.key,
  });

  final String imageNetworkSource;
  final String storeName;
  final String openAndCloseTime;
  // final List<String> subCategoryList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 50.w,
        bottom: 10.h,
        top: 10.h,
        end: 50.w,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: SizedBox(
              height: 280.w,
              width: 280.w,
              child: Image.network(
                imageNetworkSource,
                // scale: 1,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 40.w,
          ),
          SizedBox(
            height: 250.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storeName,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ColorManager.foregroundL,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  openAndCloseTime,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ColorManager.grey,
                    fontSize: 35.sp,
                  ),
                ),
                // SizedBox(
                //   height: 50.h,
                // ),
                // Row(
                //   children: [
                //     for (int i = 0; i < subCategoryList.length; i++)
                //       Padding(
                //         padding: EdgeInsets.only(right: 30.w),
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20.r),
                //             color: ColorManager.foregroundL,
                //           ),
                //           width: 60.w,
                //           height: 60.w,
                //           child: Center(
                //             child: Text(
                //               subCategoryList[i],
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 28.sp,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
