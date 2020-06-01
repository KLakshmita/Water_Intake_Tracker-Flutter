import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_reminder_app/models/drink.dart';
import 'package:water_reminder_app/src/global_blocs/app_bloc.dart';

class WaterEntryTile extends StatelessWidget {
  const WaterEntryTile({
    Key key,
    @required this.drink,
  }) : super(key: key);

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    final drinkBloc = Provider.of<AppBloc>(context).drinkBloc;
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.lightBlue,
      ),
      // Can implement undo feature
      onDismissed: (direction) => drinkBloc.removeDrink(drink),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade900 : Colors.grey.shade300,
            ),
          ),
        ),
        child: ListTile(
          title: Text(drink.amount.toString(),style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white,
                  )),
          subtitle: Text(drink.date.toString().substring(0, 10),style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white,
                  )),
         // color: Colors.white,
        ),
      ),
    );
  }
}
