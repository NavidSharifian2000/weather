import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/Screens/Search_Screen/bloc/search_bloc.dart';
import 'package:wheather/Screens/Search_Screen/bloc/search_event.dart';
import 'package:wheather/Screens/Search_Screen/data/model/faforite_city_model.dart';
import 'package:wheather/const/Colors.dart';

class serach_city_item_list extends StatelessWidget {
  city_name cityName;
  serach_city_item_list(
    this.cityName, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.5, color: CustomColors.whitetext))),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          children: [
            Text(
              cityName.name.toString(),
              style: TextStyle(
                color: CustomColors.whitetext,
                fontSize: 18,
              ),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  BlocProvider.of<City_SearchBloc>(context).add(
                      insert_city_db_event(cityName.name.toString(), context));
                },
                child: Image.asset("assets/images/plus.png"))
          ],
        ),
      ),
    );
  }
}
