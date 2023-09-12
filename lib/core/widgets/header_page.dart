import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderPage extends StatelessWidget {
  final String title;
  final bool left;
  final IconButton? right;
  final Color? color;
  const HeaderPage({
    Key? key,
    required this.title,
    required this.left,
    this.right,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.w, 150.h, 20.w, 0),
      child: SizedBox(
        width: 1080.w,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            left
                ? SizedBox(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      iconSize: 60.r,
                    ),
                  )
                : SizedBox.fromSize(
                    size: Size.fromRadius(60.r),
                  ),
            const Spacer(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color ?? const Color(0xFF303030),
                fontSize: 50.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            right ??
                SizedBox.fromSize(
                  size: Size.fromRadius(60.r),
                ),
          ],
        ),
      ),
    );
  }
}
