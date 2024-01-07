import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/Screens/Main_Screen/bloc/favorite_bloc.dart';
import 'package:wheather/Screens/Main_Screen/main_screen.dart';
import 'package:wheather/Screens/Search_Screen/bloc/search_bloc.dart';
import 'package:wheather/const/Colors.dart';
import 'package:wheather/const/text_styles.dart';
import 'package:wheather/di/di.dart';
import 'package:wheather/main.dart';

class search_appbar extends StatelessWidget {
  const search_appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApp()));
            },
            child: SizedBox(
                child: Image.asset(
              "assets/images/arrow.png",
            )),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            "Search for City",
            style: ThemeText.search_appbar_textstyle,
          )
        ],
      ),
    );
  }
}
