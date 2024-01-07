import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/Screens/Main_Screen/bloc/favorite_bloc.dart';
import 'package:wheather/Screens/Search_Screen/bloc/search_bloc.dart';
import 'package:wheather/Screens/Search_Screen/search_city_screen.dart';
import 'package:wheather/const/Colors.dart';
import 'package:wheather/const/text_styles.dart';
import 'package:wheather/di/di.dart';

class home_appbar extends StatelessWidget {
  Widget? screen;
  home_appbar({super.key, this.screen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider<City_SearchBloc>.value(
                    value: locator.get<City_SearchBloc>(),
                    child: screen,
                  ),
                ));
              },
              child: Image.asset("assets/images/add.png")),
          Text(
            "Regional Wheather",
            style: ThemeText.home_appbar_textstyle,
          ),
          Image.asset("assets/images/home.png")
        ],
      ),
    );
  }
}
