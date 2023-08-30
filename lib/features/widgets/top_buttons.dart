import 'package:amazon_clone/features/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  const TopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Vos Commandes',
              onTap: () {},
            ),
            AccountButton(
              text: 'Votre Compte', //Turn Seller
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
              text: 'Deconnexion',
              onTap: () {},
            ),
            AccountButton(
              text: 'Vos Listes',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
