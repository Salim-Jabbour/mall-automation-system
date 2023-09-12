import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:jessy_mall/config/theme/color_manager.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/widgets/error_widget.dart';
import 'package:jessy_mall/core/widgets/header_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jessy_mall/core/widgets/loading_widget.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/profile/models/wearhouse_investor_product.dart';
import 'package:jessy_mall/featuers/profile/presentation/bloc/wearhouseInvestorbloc/bloc/wearhouse_investor_bloc.dart';

class ShowIncomeOutcomePage extends StatefulWidget {
  const ShowIncomeOutcomePage({super.key, required this.isIncome});
  final bool isIncome;

  @override
  State<ShowIncomeOutcomePage> createState() => _ShowIncomeOutcomePageState();
}

class _ShowIncomeOutcomePageState extends State<ShowIncomeOutcomePage> {
  final TextEditingController dateFrom = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  final TextEditingController dateTo = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  List? inOutcomes;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<WearhouseInvestorBloc>(),
      child: Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          color: ColorManager.backgroundL,
          child: BlocConsumer<WearhouseInvestorBloc, WearhouseInvestorState>(
            listener: (context, state) {
              if (state is WearhouseInvestorGetIncomeSuccess) {
                inOutcomes = state.investorIncomModel.data!;
              }
              if (state is WearhouseInvestorGetOutcomeSuccess) {
                inOutcomes = state.investorOutcomModel.data!;
              }
            },
            builder: (context, state) {
              if (state is WearhouseInvestorGetIncomeFailure) {
                return FailuerWidget(
                    errorMessage: state.failure.message,
                    onPressed: () {
                      context
                          .read<WearhouseInvestorBloc>()
                          .add(WearhouseInvestorRequestIncoms(
                            token: context.read<AuthBloc>().token ?? '',
                          ));
                    });
              }
              if (state is WearhouseInvestorGetOutcomeFailure) {
                return FailuerWidget(
                    errorMessage: state.failure.message,
                    onPressed: () {
                      context
                          .read<WearhouseInvestorBloc>()
                          .add(WearhouseInvestorRequestOutcoms(
                            token: context.read<AuthBloc>().token ?? '',
                          ));
                    });
              }
              if (state is WearhouseInvestorInitial) {
                widget.isIncome
                    ? context
                        .read<WearhouseInvestorBloc>()
                        .add(WearhouseInvestorRequestIncoms(
                          token: context.read<AuthBloc>().token ?? '',
                        ))
                    : context
                        .read<WearhouseInvestorBloc>()
                        .add(WearhouseInvestorRequestOutcoms(
                          token: context.read<AuthBloc>().token ?? '',
                        ));
              }
              if (state is WearhouseInvestorGetIncomeLoading ||
                  state is WearhouseInvestorGetOutcomeLoading) {
                return LoadingWidget();
              }
              return Column(
                children: [
                  HeaderPage(
                      title: widget.isIncome
                          ? StringManager.income.tr()
                          : StringManager.outcome.tr(),
                      left: true),
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
                          widget.isIncome
                              ? context.read<WearhouseInvestorBloc>().add(
                                  WearhouseInvestorRequestIncoms(
                                      token:
                                          context.read<AuthBloc>().token ?? '',
                                      toDate: dateTo.text,
                                      fromDate: dateFrom.text))
                              : context.read<WearhouseInvestorBloc>().add(
                                  WearhouseInvestorRequestOutcoms(
                                      token:
                                          context.read<AuthBloc>().token ?? '',
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
                                  title: StringManager.date.tr(),
                                ),
                              ],
                            ),
                            ...?inOutcomes?.map((income) {
                              return TableRow(
                                children: [
                                  TableCellWidget(
                                    title: income.name ?? '',
                                  ),
                                  TableCellWidget(
                                    title: income.quantityAfter.toString(),
                                  ),
                                  widget.isIncome
                                      ? TableCellWidget(
                                          title: income.inDate ?? '',
                                        )
                                      : TableCellWidget(
                                          title: income.outDate ?? '',
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
                  //       // Text(
                  //       //   '10000sp',
                  //       //   style: TextStyle(
                  //       //       color: ColorManager.black,
                  //       //       fontSize: 50.sp,
                  //       //       fontWeight: FontWeight.w600),
                  //       // ),
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
