import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/core/resource/const_manager.dart';
import 'package:jessy_mall/core/widgets/custom_text_field.dart';
import 'package:jessy_mall/featuers/Auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/Auth/repository/auth_repository_impl.dart';

import '../../../../config/theme/color_manager.dart';
import '../../../../core/resource/string_manager.dart';
import '../../../../core/utils/global_snackbar.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../delivery manager/features/home/presentation/page/delivery_home_page.dart';
import '../../../../warehouse manager/warehouse_home/presintation/pages/warehouse_home_page.dart';
import '../../../bottom_navigation_bar/presintation/page/bottom_navigation_bar.dart';
import '../widgets/forgot_password_button.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/string_to_sign_up.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool visibility = false;


  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundL,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoginFailed) {
                gShowErrorSnackBar(
                    context: context, message: state.faliuer.message);
              }
              if (state is AuthLoginSuccess) {
                if (state.user.data.user.roles.first ==
                    ConstManager.warehouseManagerRole) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const WarehouseHomePage()));
                } else if (state.user.data.user.roles.first ==
                    ConstManager.deliveryManagerRole) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const DeliveryHomePage()));
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BottomNavigationBarWidget()));
                }
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 350.h,
                      ),
                      Center(
                        child: Text(
                          "JESSY",
                          style: TextStyle(
                            fontSize: 80.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 250.h,
                      ),
                      CustomTextField(
                        width: 850.w,
                        keybordType: TextInputType.emailAddress,
                        hintText: StringManager.userNameHintText.tr(),
                        icon: Icons.person,
                        textEditingController: userNameController,
                        suffixIconWidget: null,
                        visibility: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return StringManager.pleaseEnterUserName.tr();
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      CustomTextField(
                        width: 850.w,
                        keybordType: TextInputType.visiblePassword,
                        hintText: StringManager.password.tr(),
                        icon: Icons.lock,
                        textEditingController: passwordController,
                        suffixIconWidget: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                visibility = !visibility;
                              });
                            },
                            icon: Icon(
                              visibility
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: ColorManager.foregroundL,
                            ),
                          ),
                        ),
                        visibility: visibility,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return StringManager.pleaseEnterYourPassword.tr();
                          } else if (value.length <= 5) {
                            return StringManager.passwordMustBeSixCharacters
                                .tr();
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 250.h,
                      ),
                      CustomButton(
                        text: StringManager.signIn.tr(),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(AuthLoginEvent(
                                email: userNameController.text,
                                password: passwordController.text));
                          }
                        },
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      const StringToSignUp(),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  ),
                  if (state is AuthLoading)
                    const LoadingWidget(
                      fullScreen: true,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
