import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/investment_options/presentation/page/stripe_payment/stripe_keys.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:jessy_mall/featuers/splash/splash_page.dart';
import 'package:jessy_mall/warehouse%20manager/warehouse_home/presintation/pages/warehouse_home_page.dart';

import 'core/bloc/bloc_observer.dart';
import 'featuers/Auth/presintation/page/login_page.dart';
import 'featuers/bottom_navigation_bar/presintation/page/bottom_navigation_bar.dart';
import 'featuers/home_search/presentation/pages/home_search_page.dart';
import 'featuers/investment_options/presentation/bloc/invest_option_bloc/invest_option_bloc.dart';
import 'featuers/investment_options/presentation/page/invest_store_page.dart';
import 'injection_container/main_injection.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initInjection();
  Stripe.publishableKey = ApiKeys.publishablekey;
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
      // fallbackLocale: const Locale('en', 'US'),
      path: 'asset/translations',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2340),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetIt.I.get<AuthBloc>(),
            ),
            BlocProvider(
              create: (context) => GetIt.I.get<InvestOptionBloc>(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: SplashPage(),
            // home: const DeliveryHomePage(),
            // home: BottomNavigationBarWidget(),
            // home: WarehouseHomePage(),
            // home: LoginPage(),
            // home: HomeSearchPage(),
          ),
        );
      },
    );
  }
}
