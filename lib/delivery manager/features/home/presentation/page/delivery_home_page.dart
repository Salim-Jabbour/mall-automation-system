import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../config/theme/color_manager.dart';
import '../../../../../core/resource/asset_manager.dart';
import '../../../../../core/resource/string_manager.dart';
import '../../../../../core/utils/global_snackbar.dart';
import '../../../../../core/widgets/langauge_switcher_widget.dart';
import '../../../../../featuers/Auth/presintation/bloc/auth_bloc.dart';
import '../../../../../featuers/Auth/presintation/page/login_page.dart';
import 'delivery_history_body_page.dart';
import 'delivery_pending_body_page.dart';
import 'delivery_requests_body_page.dart';
import 'package:easy_localization/easy_localization.dart';

class DeliveryHomePage extends StatefulWidget {
  const DeliveryHomePage({super.key});

  @override
  State<DeliveryHomePage> createState() => _DeliveryHomePageState();
}

class _DeliveryHomePageState extends State<DeliveryHomePage> {
//for tabBar

  TabBar get _tabBar => TabBar(
        labelColor: ColorManager.black,
        unselectedLabelColor: ColorManager.grey,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: ColorManager.black,
        tabs: [
          Tab(
            icon: SizedBox(
              width: 200,
              child: Text(
                StringManager.requests.tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Tab(
            icon: SizedBox(
                width: 200,
                child: Text(
                  StringManager.pending.tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          Tab(
            icon: SizedBox(
              width: 200,
              child: Text(
                StringManager.history.tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.backgroundL,
          title: Text(
            StringManager.orders.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorManager.black,
              fontSize: 50.sp,
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          actions: [
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLogoutFailed) {
                  gShowErrorSnackBar(
                      context: context, message: state.faliuer.message);
                }
                if (state is AuthLogoutSuccess) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const LoginPage()));
                }
              },
              builder: (context, state) {
                return state is AuthLoading
                    ? Lottie.asset(AssetJsonManager.loading, height: 100.r)
                    : IconButton(
                        icon: const Icon(Icons.logout),
                        iconSize: 70.r,
                        onPressed: () {
                          context.read<AuthBloc>().add(AuthLogoutRequested());
                        },
                      );
              },
            ),
          ],
          leading: Padding(
            padding: EdgeInsetsDirectional.only(start: 20.w),
            child: GestureDetector(
              onTap: () => setState(() {}),
              child: LanguageSwitcherWidget(
                context: context,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Material(
              color: ColorManager.backgroundL,
              child: _tabBar,
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            //began
            DeliveryRequestBodyPage(),
            //End

            //began
            DeliveryPendingBodyPage(),
            //End

            //began
            DeliveryHistoryBodyPage()
            //End
//dilevery
          ],
        ),
      ),
    );
  }
}
