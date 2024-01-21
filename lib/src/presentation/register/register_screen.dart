import 'package:azercell_developer_assignment/src/common_widgets/custom_button.dart';
import 'package:azercell_developer_assignment/src/common_widgets/custom_text_field.dart';
import 'package:azercell_developer_assignment/src/presentation/register/register_provider.dart';
import 'package:azercell_developer_assignment/src/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterProvider(),
      child: Scaffold(
        backgroundColor: const Color(0xff211D2C),
        body: Consumer<RegisterProvider>(builder: (context, state, child) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFFFF1),
                  ),
                ),
                const SizedBox(height: 32.0),
                CustomTextField(
                  onChanged: (value) => state.changeName(value),
                  errorText: state.name.error,
                  label: 'Name',
                ),
                const SizedBox(height: 24.0),
                CustomTextField(
                  onChanged: (value) => state.changeSurname(value),
                  errorText: state.surname.error,
                  label: 'Surname',
                ),
                const SizedBox(height: 24.0),
                CustomTextField(
                  label: 'Birth Date',
                  controller: TextEditingController(text: state.dob.value),
                  readonly: true,
                  errorText: state.dob.error,
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      final formattedDate =
                          "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
                      state.changeDOB(formattedDate);
                    }
                  },
                ),
                const SizedBox(height: 24.0),
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 24.0),
                        child: CustomTextField(
                          hintText: '+994',
                          readonly: true,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: CustomTextField(
                        maxLength: 9,
                        onChanged: (value) => state.changeGSMNumber(value),
                        errorText: state.gsmNumber.error,
                        label: 'GSM Number',
                        inputType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 36,
                ),
                CustomButton(
                  backgroundColor: const Color(0xff7D3AD8),
                  active: state.isValid,
                  title: 'Register',
                  onPress: state.register,
                ),
              ],
            ).padTop(60),
          );
        }),
      ),
    );
  }
}
