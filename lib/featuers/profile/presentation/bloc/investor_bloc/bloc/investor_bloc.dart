

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jessy_mall/featuers/profile/repository/profile_repository.dart';

import '../../../../../../core/errors/base_error.dart';
import '../../../../models/investor_model.dart';

part 'investor_event.dart';
part 'investor_state.dart';

class InvestorBloc extends Bloc<InvestorEvent, InvestorState> {
  final ProfileRepository _profileRepository;
  InvestorBloc(this._profileRepository) : super(InvestorInitial()) {
    on<InvestorRequestProductFromMyStore>((event, emit) async {
       emit(InvestorGetProductLoading());
      final successOrFailuer =
          await _profileRepository.getMyStoreProduct(event.token);
      successOrFailuer.fold((error) {
        emit(InvestorGetProductFailuer(failure: error));
      }, (product) {
        emit(InvestorGetProductSuccess(
            investorProductModel: product));
      });
    });
        on<InvestorDeleteProductFormMyStore>((event, emit) async {
      emit(InvestorDeleteProductFromStoreLoading());
      final successOrFailuer =
          await _profileRepository.deleteProductFromStore(
              token: event.token, productId: event.productId);
      successOrFailuer.fold((error) {
        emit(InvestorDeleteProductFromStoreFailure(failure: error));
      }, (product) {
        emit(InvestorDeleteProductFromStoreSuccess());
        emit(InvestorInitial());
      });
    });

          on<InvestorRequestBills>((event, emit) async {
      emit(InvestorGetBillsLoading());
      final successOrFailuer =
          await _profileRepository.getBills(
              token: event.token, toDate: event.toDate,fromDate: event.fromDate);
      successOrFailuer.fold((error) {
        emit(InvestorGetBillsFailure(failure: error));
      }, (bills) {
        emit(InvestorGetBillsSuccess(investorBilssModel: bills));
        // emit(InvestorInitial());
      });
    });
  }
}
