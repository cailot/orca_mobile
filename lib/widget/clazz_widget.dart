import 'package:flutter/material.dart';
import 'package:flutter_first_hello_world/model/clazz_data.dart';
import 'package:flutter_first_hello_world/core/constants.dart';
import 'package:flutter_first_hello_world/pages/clazz_detail_page.dart';

class ClazzWidget extends StatelessWidget {
  const ClazzWidget({
    super.key,
    required this.box,
  });

  final ClazzData box;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ClazzDetailPage(box: box);
            },
          ),
        );
        //print('CardWidget: ${box.name}');
      },
      child: Card(
        child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(left: 25),
                child: Image.asset('images/${box.grade}.png', fit: BoxFit.contain),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(kDouble10),
                  child: Column(
                    children: [
                      Text(
                       'This is ${box.description}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        box.name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: kDouble10,
          ),
          Wrap(
            children: [
              const Icon(
                Icons.today,
              ),
              const SizedBox(
                width: kDouble10,
              ),
              Text(
                box.day,
              ),
              const SizedBox(
                width: kDouble30 * 3,
              ),
              const Icon(
                Icons.groups,
              ),
              const SizedBox(
                width: kDouble10,
              ),
              Text(
                'Total Students ${box.number}',
              ),
            ],
          ),
        ],
      ),),
    );
  }
}
