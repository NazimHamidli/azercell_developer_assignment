import 'package:azercell_developer_assignment/src/common_widgets/custom_button.dart';
import 'package:azercell_developer_assignment/src/common_widgets/custom_text_field.dart';
import 'package:azercell_developer_assignment/src/common_widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/card_number_input_formatter.dart';
import '../home_provider.dart';

class TransferFields extends StatelessWidget {
  const TransferFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, state, child) {
      return state.debitCard != null
          ? Column(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enrol to",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                controller: state.cardController,
                label: 'Card Number',
                inputType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CardNumberInputFormatter()
                ],
              ),
              const SizedBox(height: 12.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Transfer amount",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                controller: state.amountController,
                label: 'Amount',
                inputType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              const SizedBox(height: 12.0),
              state.transferLoading
                  ? const LoadingIndicator(
                      color: Color(0xffDED4F4),
                    )
                  : CustomButton(
                      backgroundColor: const Color(0xff8933D4),
                      title: 'Continue',
                      active: true,
                      onPress: state.makeTransfer),
              const SizedBox(height: 24.0),
              TextButton(
                  onPressed: state.showDeleteReason,
                  child: const Text(
                    'Remove Card',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffA340F8),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ))
            ])
          : const SizedBox();
    });
  }
}
