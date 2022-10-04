import 'package:firebase_learn/services/firebase/auth.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  TextEditingController phoneNoController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Spacer(),
        const Text('phone Authentication'),
        TextField(
          controller: phoneNoController,
          maxLength: 10,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            hintText: 'Enter Phone Number',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            debugPrint('+91${phoneNoController.text}');
            _auth.verifyPhoneNumber(
                phoneNumber: '+91${phoneNoController.text}');
          },
          child: const Text('send otp'),
        ),
        Text("Status: "),
        const Spacer(),
        TextField(
          controller: otpController,
          maxLength: 6,
          decoration: const InputDecoration(
            hintText: 'Enter OTP',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _auth.verifyCode(OTP: otpController.text);
          },
          child: const Text('verify otp'),
        ),
        Text("Status: ${_auth.currentUser}"),
        ElevatedButton(
          onPressed: () {
            _auth.signOut();
          },
          child: Text('sign out'),
        ),
        const Spacer(),
      ],
    ));
  }
}
