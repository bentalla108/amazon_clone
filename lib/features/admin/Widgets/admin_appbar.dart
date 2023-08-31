import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AdminAppBar extends StatelessWidget {
  const AdminAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBar(
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(gradient: GlobalVariables.appBarGradient),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/amazon_in.png',
                width: 120,
                height: 45,
                color: Colors.black,
              ),
            ),
            const Text(
              'Admin',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
