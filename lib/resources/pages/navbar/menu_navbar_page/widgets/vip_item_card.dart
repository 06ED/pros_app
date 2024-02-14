import 'package:flutter/material.dart';
import 'package:pros_app/app/models/dish.dart';

import '../../../../widgets/counter_widget.dart';

class VipItemCard extends StatefulWidget {
  final Dish dish;
  final Function(int count, Dish dish) addInCart;

  const VipItemCard({
    super.key,
    required this.dish,
    required this.addInCart,
  });

  @override
  State<VipItemCard> createState() => _VipItemCardState();
}

class _VipItemCardState extends State<VipItemCard> {
  late Widget _animatedWidget;

  @override
  void initState() {
    _animatedWidget = IconButton(
      onPressed: () {
        widget.addInCart(1, widget.dish);
        int prevCount = 1;
        setState(() {
          _animatedWidget = Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromARGB(255, 30, 54, 133),
                )),
            child: CounterButton(
              1,
              min: 0,
              onPressed: (count) {
                widget.addInCart(count - prevCount, widget.dish);
                prevCount = count;
              },
              size: 20,
            ),
          );
        });
      },
      icon: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 40,
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 30, 54, 133),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
    super.initState();
  }

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
            child: widget.dish.image,
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        widget.dish.title!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(
                        top: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255, 30, 54, 133),
                        ),
                      ),
                      child: Text(
                        "${widget.dish.price}₽",
                        style: TextStyle(
                          color: Color.fromARGB(255, 30, 54, 133),
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedSwitcher(
                  transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                  duration: Duration(milliseconds: 190),
                  child: _animatedWidget,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
