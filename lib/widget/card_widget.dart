import 'package:flutter/material.dart';
import 'package:flutter_first_hello_world/class/item_class.dart';
import 'package:flutter_first_hello_world/core/constants.dart';
import 'package:flutter_first_hello_world/pages/description_page.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.box,
  });

  final ItemClass box;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DescriptionPage(box : box);
            },
          ),
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(kDouble10),
          child: Column(
            children: [
              const SizedBox(
                height: kDouble5,
              ),
              Image.asset(box.imagePath),
              Text(
                box.title,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('This is the ${box.title} description '),
              const SizedBox(
                height: kDouble10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
