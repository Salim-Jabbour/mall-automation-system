import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/config/theme/color_manager.dart';
import 'package:jessy_mall/featuers/investment_options/presentation/widgets/investment_store.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/resource/string_manager.dart';
import '../bloc/invest_option_bloc/invest_option_bloc.dart';

class InvestmentOptions extends StatelessWidget {
  const InvestmentOptions({super.key});
  TabBar get _tabBar => TabBar(
        labelColor: ColorManager.black,
        unselectedLabelColor: ColorManager.grey,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: ColorManager.black,
        tabs: [
          Tab(
            icon: SizedBox(
              width: 350.w,
              child: const Icon(
                Icons.store_mall_directory,
              ),
            ),
          ),
          // Tab(
          //   icon: SizedBox(
          //       width: 350.w,
          //       child: Icon(
          //         Icons.table_rows_rounded,
          //       )),
          // ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: BlocProvider(
        create: (context) => GetIt.I.get<InvestOptionBloc>(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.backgroundL,
            title: Text(
              StringManager.investmentOption.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorManager.black,
                fontSize: 50.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Material(
                color: ColorManager.backgroundL,
                child: _tabBar,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              //began investment store UI
              InvestmentStoreUI(),
              //End investment store UI

              // began investment stand
              // InvestmentStandUI(),
              //end investment stand
            ],
          ),
        ),
      ),
    );
  }
}

// class Listing {
//   final String space;
//   final String type;
//   final String price;

//   Listing({
//     required this.space,
//     required this.type,
//     required this.price,
//   });
// }

// class InvestmentStandUI extends StatelessWidget {
//   // final List<Listing> listings = [
//   //   Listing(
//   //     space: '120 sq. ft.',
//   //     type: 'Snack',
//   //     price: '\$500/year',
//   //   ),
//   //   Listing(
//   //     space: '80 sq. ft.',
//   //     type: 'Caffe',
//   //     price: '\$400/year',
//   //   ),
//   //   // Add more listings as needed
//   // ];

//   InvestmentStandUI({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           // SizedBox(height: 200, child: WebViewWidget(controller: _controller)),
//           Card(
//             elevation: 4.0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16.0),
//             ),
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Text(
//                       "In this option you can immediately invest until 5 stands,\n every stand have one metter space, and you can have a type in each stand."),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Text(
//                       "Available types\n price per month \n types: kitchen stuff, Detergent, canned food."),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }
