import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/features/home/widgets/address_box.dart';
import 'package:amazon_clone_app/features/home/widgets/top_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF232f3f),
        toolbarHeight: kToolbarHeight,
        centerTitle: true,
        title: Column(
          children: [
            const SizedBox(height: 15),
            Image.asset(
              'assets/images/amazon_in.png',
              height: 45,
              color: Colors.white,
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Container(
            height: 48,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(2),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: GlobalVariables.kSecondaryColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: 'What are you looking for?',
                isDense: true,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Container(
                  margin: const EdgeInsets.only(left: 0, right: 10, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: GlobalVariables.kSecondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.keyboard_voice_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: const [
          AddressBox(),
          SizedBox(height: 15),
          TopCategories(),
        ],
      ),
    );
  }
}
