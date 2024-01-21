import 'dart:math';
import 'package:azercell_developer_assignment/src/common_widgets/sheets.dart';
import 'package:azercell_developer_assignment/src/domain/debit_cart.dart';
import 'package:azercell_developer_assignment/src/domain/user.dart';
import 'package:flutter/material.dart';
import '../../app.dart';

class HomeProvider extends ChangeNotifier {
  late User userInfo;
  DebitCard? debitCard;
  final amountController = TextEditingController();
  final cardController = TextEditingController();
  bool transferLoading = false;

  getUser(User user) {
    userInfo = user;
  }

  set updateDebitCard(DebitCard? card) {
    debitCard = card;
    notifyListeners();
  }

  String generateRandomCardNumber() {
    String cardNumber = '';
    for (int i = 0; i < 16; i++) {
      cardNumber += Random().nextInt(9).toString();
    }
    return cardNumber;
  }

  makeTransfer() async {
    transferLoading = true;
    notifyListeners();
    if (cardController.text.length == 19 &&
        double.tryParse(amountController.text) != null) {
      final scaffold = ScaffoldMessenger.of(navigatorKey.currentContext!);
      await Future.delayed(const Duration(milliseconds: 1500), () {
        final result = lowerFunds(double.tryParse(amountController.text)!);
        result
            ? scaffold.showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Center(
                    child: Text(
                      'Payment Successful',
                    ),
                  ),
                ),
              )
            : scaffold.showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      'Payment Unsuccessful: Insufficient Funds',
                    ),
                  ),
                ),
              );
      });
      amountController.text = '';
      cardController.text = '';
    } else {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xff282F39),
          content: Center(
            child: Text(
              'Please enter a valid number',
            ),
          ),
        ),
      );
    }
    transferLoading = false;
    notifyListeners();
  }

  bool lowerFunds(double money) {
    double currentBalance = debitCard!.balance - money;
    if (currentBalance < 0) {
      return false;
    }
    updateDebitCard = debitCard!.copyWith(balance: currentBalance);
    return true;
  }

  showDeleteReason() {
    Sheets.showCardDeleteSheet(onClick: () {
      updateDebitCard = null;
      Navigator.pop(navigatorKey.currentContext!);
    });
  }
}
