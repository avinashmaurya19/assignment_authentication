import 'package:assignment_authentication/mobile_no.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({super.key});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> resendOTP() async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber:
              "+917880544325", // Replace with the phone number to resend OTP
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            // Handle verification failed scenarios here, if any.
            print('Verification failed: ${e.message}');
          },
          codeSent: (String verificationId, int? resendToken) {
            print('Verification code sent again');
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print('Auto-retrieval timeout');
          });
    } catch (e) {
      print('Error resending OTP: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // for otp box show

    var code = "";

    return Scaffold(
      // for back arrow button
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
          margin: const EdgeInsets.only(left: 24, right: 25),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Verify Phone',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 20,
                ),

                //for entering mobile number

                const SizedBox(
                  height: 20,
                ),

                Pinput(
                  length: 6,
                  showCursor: true,
                  onChanged: (value) {
                    code = value;
                  },
                ),

                const SizedBox(
                  height: 20,
                ),

                // TextButton for resend functionality
                SizedBox(
                  // height: 45,
                  // width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      resendOTP();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Didnt receive the code?',
                          style: TextStyle(color: Color(0xff6A6C7B)),
                        ),
                        Text(
                          'Request Again',
                          style: TextStyle(color: Color(0xff061D28)),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: MobileNumber.verify,
                                smsCode: code);

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamedAndRemoveUntil(
                            context, "home", (route) => false);
                      } catch (e) {
                        // print('wrong otp');
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('wrong otp')));
                      }
                    },
                    child: const Text('VERIFY AND CONTINUE'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFF2E3B62)),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
