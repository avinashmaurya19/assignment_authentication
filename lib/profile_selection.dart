import 'package:flutter/material.dart';

enum ProductTypeEnum { Shipper, Transporter }

class ProfileSelection extends StatefulWidget {
  const ProfileSelection({super.key});

  @override
  State<ProfileSelection> createState() => _ProfileSelectionState();
}

class _ProfileSelectionState extends State<ProfileSelection> {
  ProductTypeEnum? _productTypeEnum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please select your profile',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              RadioListTile(
                contentPadding: const EdgeInsets.all(8.0),
                value: ProductTypeEnum.Transporter,
                groupValue: _productTypeEnum,
                dense: true,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                ),
                tileColor: Colors.grey.shade100,
                title: Row(
                  children: [
                    Icon(
                      Icons.home_filled,
                      size: MediaQuery.of(context).size.width * .1,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipper',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Lorem ipsum dolor sit amet dolor sit amet,consectetur adipiscing',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                onChanged: (val) {
                  setState(() {
                    _productTypeEnum = val;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              RadioListTile(
                contentPadding: const EdgeInsets.all(8.0),
                value: ProductTypeEnum.Shipper,
                groupValue: _productTypeEnum,
                dense: true,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(new Radius.circular(4))),
                tileColor: Colors.grey.shade100,
                title: Row(
                  children: [
                    Icon(
                      Icons.fire_truck,
                      size: MediaQuery.of(context).size.width * .1,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Transporter',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet dolor sit amet,consectetur adipiscing',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                onChanged: (val) {
                  setState(() {
                    _productTypeEnum = val;
                  });
                },
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 60, 76, 107))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
