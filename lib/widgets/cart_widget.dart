import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:restapp_automa/blocs/stripe_payment/payment_bloc.dart';

import '../models/dish.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  bool isFetchingData = true;
  List<Dish> dishList = [];
  CardFieldInputDetails _card = const CardFieldInputDetails(complete: false);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Pagamento",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<PaymentBloc, PaymentState>(
                    builder: (context, state) {
                      Widget child = const SizedBox();
                      switch (state.status) {
                        case PaymentStatus.initial:
                          child = Column(
                            children: [
                              CardFormField(
                                onCardChanged: (card) =>
                                    setState(() => _card = card!),
                              ),
                              Visibility(
                                visible: true,
                                child: ElevatedButton.icon(
                                  onPressed: () => context
                                      .read<PaymentBloc>()
                                      .add(
                                        const PaymentCreateIntent(items: []),
                                      ),
                                  icon: const Icon(Icons.payment),
                                  label: const Text("Paga senza errore"),
                                ),
                              ),
                              Visibility(
                                visible: true,
                                child: ElevatedButton.icon(
                                  onPressed: () =>
                                      context.read<PaymentBloc>().add(
                                            const PaymentCreateIntent(
                                              items: [],
                                              error: true,
                                            ),
                                          ),
                                  icon: const Icon(Icons.payment),
                                  label: const Text("Paga con errore"),
                                ),
                              ),
                            ],
                          );
                          break;
                        case PaymentStatus.loading:
                          child = const CircularProgressIndicator();
                          break;
                        case PaymentStatus.finished:
                          child = Column(
                            children: [
                              const Text("Il pagamento è andato a buon fine"),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<PaymentBloc>()
                                      .add(PaymentStart());
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Ritorna"),
                              )
                            ],
                          );
                          break;
                        case PaymentStatus.error:
                          child = Column(
                            children: [
                              const Text(
                                  "Il pagamento non è andato a buon fine"),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () => context
                                    .read<PaymentBloc>()
                                    .add(PaymentStart()),
                                child: const Text("Ritenta"),
                              )
                            ],
                          );
                          break;
                      }

                      return child;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: InkWell(
        //   onTap: () {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       const SnackBar(
        //         content: Text('Payment Successful'),
        //         duration: Duration(seconds: 2),
        //       ),
        //     );
        //   },
        //   child: Container(
        //     color: Colors.yellow.shade600,
        //     alignment: Alignment.center,
        //     height: 50.0,
        //     child: const Text(
        //       'Proceed to Pay',
        //       style: TextStyle(
        //         fontSize: 18.0,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        // ),
      );
}
