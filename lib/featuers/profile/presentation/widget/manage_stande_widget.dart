import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/featuers/profile/presentation/page/show_bills_page.dart';
import 'package:jessy_mall/featuers/profile/presentation/widget/profile_card_widget.dart';

import '../../../../config/theme/color_manager.dart';
import '../../../products_in_store/presentation/pages/products_in_store_page.dart';
import 'package:easy_localization/easy_localization.dart';

class ManageMyStandWidget extends StatelessWidget {
  const ManageMyStandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        color: ColorManager.backgroundL,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200.h,
              ),
              ProfileCardWidget(
                titleInListTile: StringManager.uploadExcel.tr(),
                subtitleInListTile: StringManager.uploadExcelDesc.tr(),
                navigatorFunc: () {},
              ),
              ProfileCardWidget(
                titleInListTile: StringManager.showProduct.tr(),
                subtitleInListTile:
                    "${StringManager.youHave.tr()} 4 ${StringManager.products.tr()}",
                navigatorFunc: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProductsInStorePage()));
                },
              ),
              ProfileCardWidget(
                titleInListTile: StringManager.showBills.tr(),
                subtitleInListTile: "",
                navigatorFunc: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ShowBillsPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
