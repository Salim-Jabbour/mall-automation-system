import 'package:bloc/bloc.dart';
import 'package:jessy_mall/core/errors/base_error.dart';
import 'package:jessy_mall/featuers/investment_options/models/investment_store_model.dart';
import 'package:jessy_mall/featuers/investment_options/repository/invest_option_repository.dart';
import 'package:meta/meta.dart';

part 'invest_option_event.dart';
part 'invest_option_state.dart';

class InvestOptionBloc extends Bloc<InvestOptionEvent, InvestOptionState> {
  final InvestOptionRepository _investOptionRepository;

  InvestOptionBloc(this._investOptionRepository)
      : super(InvestOptionInitial()) {
    on<GetInvestStoreOption>((event, emit) async {
      // TODO: implement event handler
      emit(InvestOptionLoading());
      final successOrFailuer =
          await _investOptionRepository.getStoreOptionToInvest(event.token);

      successOrFailuer.fold((error) {
        emit(InvestStoreOptionFailed(failure: error));
      }, (investStoreModel) {
        emit(InvestStoreOptionSuccessd(investStoreModel: investStoreModel));
      });
    });
    on<InvestStoreEvent>((event, emit) async {
      // TODO: implement event handler
      emit(InvestStoreByIdLoading());
      final successOrFailuer = await _investOptionRepository
          .postInvestStorebyId(event.storeId, event.token);

      successOrFailuer.fold((error) {
        emit(InvestStoreByIdFailed(failure: error));
        emit(InvestOptionInitial());
      }, (data) {
        emit(InvestStoreByIdSuccess());
        emit(InvestOptionInitial());
      });
    });
  }
}
