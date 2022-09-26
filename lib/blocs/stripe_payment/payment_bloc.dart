import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState()) {
    on<PaymentStart>(_onPaymentStart);
    on<PaymentCreateIntent>(_onPaymentCreateIntent);
  }

  void _onPaymentStart(PaymentStart event, Emitter<PaymentState> emit) =>
      emit(state.copyWith(status: PaymentStatus.initial));

  void _onPaymentCreateIntent(
    PaymentCreateIntent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(status: PaymentStatus.loading));

    //TODO server call
    await Future.delayed(
      const Duration(seconds: 3),
      () => emit(
        state.copyWith(
          status: event.error ? PaymentStatus.error : PaymentStatus.finished,
        ),
      ),
    );
  }
}
