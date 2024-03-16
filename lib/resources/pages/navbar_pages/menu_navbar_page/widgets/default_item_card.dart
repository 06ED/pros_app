import 'package:flutter/material.dart';
import '/app/models/dish.dart';

class DefaultItemCard extends StatelessWidget {
  final Dish dish;

  const DefaultItemCard({
    super.key,
    required this.dish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 241, 241, 241),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: dish.image,
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              left: 15,
              bottom: 5,
            ),
            child: Text(
              dish.title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Divider(
            endIndent: 10,
            indent: 10,
            color: Color.fromARGB(255, 102, 102, 102),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5,
              left: 15,
              bottom: 15,
            ),
            alignment: Alignment.bottomLeft,
            child: Column(
              children: [
                Text(
                  "${dish.weight} гр\n${dish.price}₽",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 102, 102, 102),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
