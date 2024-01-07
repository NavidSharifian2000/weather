import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wheather/Screens/Search_Screen/bloc/search_bloc.dart';
import 'package:wheather/Screens/Search_Screen/bloc/search_state.dart';
import 'package:wheather/const/Colors.dart';
import 'package:wheather/const/text_styles.dart';
import 'package:wheather/const/wheather_gradiant_background.dart';
import 'package:wheather/widgets/search_appbar.dart';
import 'package:wheather/widgets/search_city_item_list.dart';
import 'package:wheather/widgets/search_component.dart';

class search_citty_screen extends StatelessWidget {
  const search_citty_screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<City_SearchBloc, City_Search_State>(
          builder: (context, state) {
        return Stack(children: [
          Container(
            decoration: BoxDecoration(gradient: wheather_gradiaant()),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30,
              ),
              search_appbar(),
              SizedBox(
                height: 42,
              ),
              search_component(),
              SizedBox(
                height: 42,
              ),
              Expanded(
                child: Container(
                  color: null,
                  child: Stack(children: [
                    CustomScrollView(
                      slivers: [
                        if (state is City_Search_LoadingState) ...{
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(),
                                )
                              ],
                            ),
                          )
                        } else if (state is City_Search_ssuccessState) ...{
                          state.city_name_list.fold(
                              (l) => SliverToBoxAdapter(
                                      child: Center(
                                          child: Text(
                                    l.toString(),
                                    style: ThemeText.alert_textstyle,
                                  ))),
                              (r) => SliverList.builder(
                                    itemBuilder: (context, index) {
                                      return serach_city_item_list(r[index]);
                                    },
                                    itemCount: r.length,
                                  ))
                        } else if (state is City_insert_sucsees)
                          ...{}
                      ],
                    ),
                  ]),
                ),
              )
            ],
          ),
        ]);
      }),
    ));
  }
}
