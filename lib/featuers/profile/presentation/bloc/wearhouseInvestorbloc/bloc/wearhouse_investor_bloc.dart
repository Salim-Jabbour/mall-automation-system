import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jessy_mall/featuers/profile/models/wearhouse_investor_product.dart';
import 'package:jessy_mall/featuers/profile/presentation/bloc/profile_bloc.dart';
import 'package:jessy_mall/featuers/profile/repository/profile_repository.dart';

import '../../../../../../core/errors/base_error.dart';

part 'wearhouse_investor_event.dart';
part 'wearhouse_investor_state.dart';

class WearhouseInvestorBloc
    extends Bloc<WearhouseInvestorEvent, WearhouseInvestorState> {
  final ProfileRepository _profileRepository;
  WearhouseInvestorBloc(this._profileRepository)
      : super(WearhouseInvestorInitial()) {
    on<WearhouseInvestorRequestData>((event, emit) async {
      emit(WearhouseInvestorGetDataLoading());
      final successOrFailuer =
          await _profileRepository.getProductFromWearhouse(event.token);
      successOrFailuer.fold((error) {
        emit(WearhouseInvestorGetDataFailure(failure: error));
      }, (product) {
        emit(WearhouseInvestorGetDataSuccess(
            wearhouseInvestorProductModel: product));
      });
    });

    on<WearhouseInvestorDeleteProduct>((event, emit) async {
      emit(WearhouseInvestorDeleteProductLoading());
      final successOrFailuer =
          await _profileRepository.deleteProductFromWearhouse(
              token: event.token, productId: event.productId);
      successOrFailuer.fold((error) {
        emit(WearhouseInvestorDeleteProductFailure(failure: error));
      }, (product) {
        emit(WearhouseInvestorDeleteProductSuccess());
        emit(WearhouseInvestorInitial());
      });
    });
    on<WearhouseInvestorRequestExtraSpace>((event, emit) async {
      emit(WearhouseInvestorRequestExtraSpaceLoading());
      final successOrFailuer = await _profileRepository.requestExtraSpace(
          token: event.token, space: event.space);
      successOrFailuer.fold((error) {
        emit(WearhouseInvestorDeleteProductFailure(failure: error));
      }, (product) {
        emit(WearhouseInvestorRequestExtraSpaceSuccess());
        emit(WearhouseInvestorInitial());
      });
    });

    on<WearhouseInvestorRequestIncoms>((event, emit) async {
      emit(WearhouseInvestorGetIncomeLoading());
      final successOrFailuer = await _profileRepository.getIncoms(
          token: event.token, fromDate: event.fromDate, toDate: event.toDate);
      successOrFailuer.fold((error) {
        emit(WearhouseInvestorGetIncomeFailure(failure: error));
      }, (income) {
        emit(WearhouseInvestorGetIncomeSuccess(investorIncomModel: income));
        // emit(WearhouseInvestorInitial());
      });
    });

      on<WearhouseInvestorRequestOutcoms>((event, emit) async {
      emit(WearhouseInvestorGetOutcomeLoading());
      final successOrFailuer = await _profileRepository.getOutcomes(
          token: event.token, fromDate: event.fromDate, toDate: event.toDate);
      successOrFailuer.fold((error) {
        emit(WearhouseInvestorGetOutcomeFailure(failure: error));
      }, (outcome) {
        emit(WearhouseInvestorGetOutcomeSuccess(investorOutcomModel: outcome));
        // emit(WearhouseInvestorInitial());
      });
    });
  }
}
