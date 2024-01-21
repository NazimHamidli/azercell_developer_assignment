import 'package:azercell_developer_assignment/src/domain/user.dart';
import 'package:azercell_developer_assignment/src/presentation/home/widgets/card_field.dart';
import 'package:azercell_developer_assignment/src/presentation/home/widgets/transfer_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider()..getUser(user),
      child: Scaffold(
        backgroundColor: const Color(0xff0C0413),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Welcome, ${user.name}!',
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 24.0),
              CardField(),
              SizedBox(height: 24.0),
              TransferFields(),
            ],
          ),
        ),
      ),
    );
  }
}
