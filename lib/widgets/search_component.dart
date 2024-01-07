import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/Screens/Search_Screen/bloc/search_bloc.dart';
import 'package:wheather/Screens/Search_Screen/bloc/search_event.dart';
import 'package:wheather/const/Colors.dart';
import 'package:wheather/const/text_styles.dart';

class search_component extends StatelessWidget {
  const search_component({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = new TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
            color: CustomColors.whitetext,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        width: MediaQuery.of(context).size.width,
        height: 48,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    if (textEditingController.text != null) {
                      BlocProvider.of<City_SearchBloc>(context).add(
                          City_Search_getdataEvent(textEditingController.text));
                    }
                  },
                  child: Image.asset("assets/images/search.png")),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: ThemeText.search_hint_component_textstyle,
                      hintText: 'Search for a city...'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
