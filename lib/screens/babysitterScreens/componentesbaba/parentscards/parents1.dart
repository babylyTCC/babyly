import 'package:Pedagodino/models/globals.dart';
import 'package:flutter/material.dart';

class parent1 extends StatelessWidget {
  const parent1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: Color.fromARGB(255, 249, 247, 247),
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 13.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              medalha1
                  ? IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/parent1.png'),
                      iconSize: 40,
                    )
                  : IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/parent1.png'),
                      iconSize: 60,
                    ),
              const SizedBox(width: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    "Erick",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "Enzo - 4 anos",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
