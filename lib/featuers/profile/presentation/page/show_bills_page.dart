import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:jessy_mall/config/theme/color_manager.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/widgets/header_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jessy_mall/featuers/profile/models/investor_model.dart';
import 'package:jessy_mall/featuers/profile/presentation/bloc/investor_bloc/bloc/investor_bloc.dart';

import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../Auth/presintation/bloc/auth_bloc.dart';

class ShowBillsPage extends StatefulWidget {
  const ShowBillsPage({super.key});

  @override
  State<ShowBillsPage> createState() => _ShowBillsPageState();
}

class _ShowBillsPageState extends State<ShowBillsPage> {
  final TextEditingController dateFrom = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  final TextEditingController dateTo = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  List<investorBillsDataModels>? bills;
  int totalAllPrice = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<InvestorBloc>(),
      child: Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          color: ColorManager.backgroundL,
          child: BlocConsumer<InvestorBloc, InvestorState>(
            listener: (context, state) {
              if (state is InvestorGetBillsSuccess &&
                  state.investorBilssModel.data!.isNotEmpty) {
                bills = state.investorBilssModel.data;
                //sami start
                //for loop for total price

                // double singlePriceWithQuantity = cartResponseModel!
                //         .data!.cart_orders![i].storeProduct!.price! *
                //     cartResponseModel!.data!.cart_orders![i].quantity!
                //         .toDouble();
                // totalPrice += singlePriceWithQuantity;
                // print(totalPrice);
              }
              //sami end

              if (state is InvestorGetBillsSuccess &&
                  state.investorBilssModel.data!.isEmpty) {
                bills!.clear();
              }
            },
            builder: (context, state) {
              if (state is InvestorGetBillsFailure) {
                return FailuerWidget(
                    errorMessage: state.failure.message,
                    onPressed: () {
                      context.read<InvestorBloc>().add(InvestorRequestBills(
                            token: context.read<AuthBloc>().token ?? '',
                          ));
                    });
              }
              if (state is InvestorInitial) {
                context.read<InvestorBloc>().add(InvestorRequestBills(
                      token: context.read<AuthBloc>().token ?? '',
                    ));
              }
              if (state is InvestorGetBillsLoading) {
                return LoadingWidget();
              }
              return Column(
                children: [
                  HeaderPage(title: StringManager.myBills.tr(), left: true),
                  SizedBox(
                    height: 150.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2019),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            setState(() {
                              dateFrom.text =
                                  DateFormat('yyyy-MM-dd').format(picked);
                            });
                          }
                        },
                        child: Container(
                          height: 160.h,
                          width: 400.w,
                          decoration: BoxDecoration(
                              color: const Color(0xaa333333),
                              borderRadius: BorderRadius.circular(30.r)),
                          child: Center(
                            child: Text(
                              '${StringManager.from.tr()}: ${dateFrom.text}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30.sp),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.parse(dateFrom.text),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            setState(() {
                              dateTo.text =
                                  DateFormat('yyyy-MM-dd').format(picked);
                            });
                          }
                        },
                        child: Container(
                          height: 160.h,
                          width: 400.w,
                          decoration: BoxDecoration(
                              color: const Color(0xaaeeeeee),
                              borderRadius: BorderRadius.circular(30.r)),
                          child: Center(
                            child: Text(
                              '${StringManager.to.tr()}: ${dateTo.text}',
                              style: TextStyle(
                                  color: ColorManager.black, fontSize: 30.sp),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<InvestorBloc>().add(InvestorRequestBills(
                              token: context.read<AuthBloc>().token ?? '',
                              toDate: dateTo.text,
                              fromDate: dateFrom.text));
                        },
                        child: Container(
                          height: 100.h,
                          width: 100.h,
                          decoration: BoxDecoration(
                              color: const Color(0xaa3CDDE8),
                              borderRadius: BorderRadius.circular(20.r)),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  SizedBox(
                    height: 1200.h,
                    width: 1.sw,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 40.w),
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: TableBorder.all(color: ColorManager.grey),
                          children: [
                            TableRow(
                              children: [
                                TableCellWidget(
                                  title: StringManager.productName.tr(),
                                ),
                                TableCellWidget(
                                  title: StringManager.quantity.tr(),
                                ),
                                TableCellWidget(
                                  title: StringManager.price.tr(),
                                ),
                              ],
                            ),
                            ...?bills?.map((bill) {
                              return TableRow(
                                children: [
                                  TableCellWidget(
                                    title: bill.name ?? '',
                                  ),
                                  TableCellWidget(
                                    title: bill.quantity.toString(),
                                  ),
                                  TableCellWidget(
                                    title:
                                        (bill.price! * bill.quantity!.toInt())
                                            .toString(),
                                  ),
                                ],
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  //TODO sami
                  // Padding(
                  //   padding: EdgeInsetsDirectional.symmetric(horizontal: 60.w),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         '${StringManager.total.tr()}: ',
                  //         style: TextStyle(
                  //             color: ColorManager.grey,
                  //             fontSize: 50.sp,
                  //             fontWeight: FontWeight.w700),
                  //       ),
                  //       Text(
                  //         '$totalAllPrice',
                  //         style: TextStyle(
                  //             color: ColorManager.black,
                  //             fontSize: 50.sp,
                  //             fontWeight: FontWeight.w600),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class TableCellWidget extends StatelessWidget {
  const TableCellWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(
        height: 100.h,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorManager.grey, fontSize: 30.sp),
          ),
        ),
      ),
    );
  }
}
