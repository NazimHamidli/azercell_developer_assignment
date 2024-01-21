import 'package:azercell_developer_assignment/src/utils/string_extensions.dart';
import 'package:azercell_developer_assignment/src/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/debit_cart.dart';
import '../home_provider.dart';

class CardField extends StatelessWidget {
  const CardField({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, state, child) {
      bool showCard = state.debitCard != null;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 200,
        decoration: BoxDecoration(
          color: showCard ? const Color(0xffDED4F4) : const Color(0xff211D2C),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: showCard
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: state.debitCard!.cardNumber
                          .buildTextWidgets(showCard),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        const Text(
                          'Valid: ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          state.debitCard!.expDate,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Color(0xff757575),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          state.userInfo.name ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xff757575),
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          state.userInfo.surname ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xff757575),
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Balance:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          '${state.debitCard?.balance ?? 0.0} AZN',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xff757575),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ).padAll(16.0)
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffDED4F4)),
                  onPressed: () {
                    state.updateDebitCard = DebitCard(
                      cardNumber: state.generateRandomCardNumber(),
                    );
                  },
                  child: const Text(
                    'Create New Debit Card',
                    style: TextStyle(color: Color(0xff211D2C)),
                  )),
        ),
      );
    });
  }
}
