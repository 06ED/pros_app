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
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: dish.image,
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 220,
                  child: Text(
                    dish.title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 30, 54, 133),
                    ),
                  ),
                  child: Text(
                    "${dish.price}₽",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 30, 54, 133),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
