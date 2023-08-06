import 'package:assignment_authentication/mobile_no.dart';
import 'package:flutter/material.dart';

class Frame extends StatefulWidget {
  const Frame({super.key});

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
          ),
          const Center(
              child: Icon(
            Icons.image,
            size: 50,
            color: (Color.fromARGB(89, 17, 40, 50)),
          )),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Please select your language',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            width: 200,
            child: Text(
              'You can change the language at any time',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Container(
              width: 250,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                    value: dropdownValue,
                    icon: const SizedBox.shrink(),
                    items: ['English', 'Hindi', 'Bangali', 'Urdu']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 30),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MobileNumber(),
                      ));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 60, 76, 107))),
                child: const Text(
                  'NEXT',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
          ),
          const Spacer(),
          Image.asset('assets/images/imgwal.jpg',
              width: double.infinity, height: 150, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
