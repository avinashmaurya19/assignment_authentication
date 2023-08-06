import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({super.key});

  static String verify = "";

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  TextEditingController countrycode = TextEditingController();
  var phone = "";
  PhoneNumber? phoneNumber;

  @override
  void initState() {
    countrycode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(left: 24, right: 25),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Plese enter your mobile number',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 200,
                  child: Text(
                    "you'll recieve a 4 digit code to verify next",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(
                  height: 20,
                ),

                //for send the code button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Merged container for country code and phone number input
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                                width:
                                    10), // Add spacing between country code and phone input

                            Expanded(
                              flex: 2,
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  setState(() {
                                    phoneNumber = number;
                                  });
                                },
                                selectorConfig: const SelectorConfig(
                                  selectorType: PhoneInputSelectorType.DIALOG,
                                ),

                                // Set the initial country code to India

                                initialValue: PhoneNumber(
                                    isoCode:
                                        Platform.localeName.split('_').last,
                                    phoneNumber: '-'),

                                inputDecoration: const InputDecoration(
                                  labelText: 'Mobile Number',
                                  border: InputBorder
                                      .none, // Remove the input field border
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ), // Add spacing between phone input and button
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (phoneNumber != null) {
                              // Perform phone number verification
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: phoneNumber!.phoneNumber!,
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {},
                                verificationFailed:
                                    (FirebaseAuthException e) {},
                                codeSent:
                                    (String verificationId, int? resendToken) {
                                  MobileNumber.verify = verificationId;
                                  Navigator.pushNamed(context, "otp");
                                },
                                codeAutoRetrievalTimeout:
                                    (String verificationId) {},
                              );
                            }
                          },
                          child: const Text('CONTINUE'),
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 2, 3, 86),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
