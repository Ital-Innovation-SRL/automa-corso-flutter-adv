part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
}

class PaymentStart extends PaymentEvent {
  @override
  List<Object?> get props => [];
}

class PaymentCreateIntent extends PaymentEvent {
  /*
  [
    {
      "id": 1,
      "price": 10.5
    },
    {
      "id": 2,
      "price": 15
    },
  ]
   */

  final List<Map<dynamic, String>> items;
  final bool error;

  const PaymentCreateIntent({
    required this.items,
    this.error = false,
  });

  @override
  List<Object?> get props => [
        items,
        error,
      ];
}
