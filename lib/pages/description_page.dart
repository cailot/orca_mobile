import 'package:flutter/material.dart';
import 'package:flutter_first_hello_world/class/item_class.dart';
import 'package:flutter_first_hello_world/core/constants.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({
    super.key,
    required this.box,
  });

  final ItemClass box;

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  double fontSize = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.box.title),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('This is a snackbar'),
                  duration: Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.blueAccent,
                ),
              );
            },
            icon: const Icon(Icons.perm_device_information),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDouble10),
          child: Column(
            children: [
              Image.asset(widget.box.imagePath),
              Wrap(
                spacing: kDouble10,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        fontSize = 20.0;
                      });
                    },
                    child: const Text(
                      'Small Title',
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                       setState(() {
                        fontSize = 50.0;
                      });
                    },
                    child: const Text(
                      'Medium Title',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                       setState(() {
                        fontSize = 100.0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Large Title',
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                       setState(() {
                        fontSize = 200.0;
                      });
                    },
                    child: const Text(
                      'Huge Title',
                    ),
                  ),
                ],
              ),
              FittedBox(
                child: Text(
                  widget.box.title,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: kDouble10,
              ),
              const Text(
                descriptionPage,
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: kDouble10,
              ),
              const Text(
                descriptionPage,
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
