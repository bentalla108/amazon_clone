import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdressBox extends StatelessWidget {
  final String adress;
  const AdressBox({super.key, required this.adress});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 114, 226, 221),
            Color.fromARGB(255, 1, 226, 221),
          ],
          stops: [0.5, 1.0],
        ),
      ),
      padding: const EdgeInsets.only(left: 10),
      child: Row(children: [
        const Icon(
          Icons.location_on_outlined,
          size: 20,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text('Livrer à : ${user.name} - ${user.address}'),
        ))
      ]),
    );
  }
}
