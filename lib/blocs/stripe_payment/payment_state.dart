part of 'payment_bloc.dart';

enum PaymentStatus { initial, loading, finished, error }

class PaymentState extends Equatable {
  final PaymentStatus status;

  const PaymentState({
    this.status = PaymentStatus.initial,
  });

  PaymentState copyWith({
    PaymentStatus? status,
  }) =>
      PaymentState(
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [status];
}
