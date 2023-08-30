import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal Du jour',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1683798243721-f6513c89c821?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c2hlcHBlciUyMGRvZHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: const Text(
            '\$',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            'A beatiful white dog ? ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1605725657590-b2cf0d31b1a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHNoZXBoZXJkJTIwZG9nfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1553882809-a4f57e59501d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1620468772810-70bbd0df92b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHNoZXBoZXJkJTIwZG9nfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1553882809-a4f57e59501d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: (Text(
            'Voir tous les deals',
            style: TextStyle(color: Colors.cyan[800]),
          )),
        )
      ],
    );
  }
}
