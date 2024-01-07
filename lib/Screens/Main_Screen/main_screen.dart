import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/Screens/Main_Screen/bloc/favorite_bloc.dart';
import 'package:wheather/Screens/Main_Screen/bloc/favorite_event.dart';
import 'package:wheather/Screens/Main_Screen/bloc/favorite_state.dart';
import 'package:wheather/Screens/Main_Screen/data/model/faforite_city_model.dart';
import 'package:wheather/Screens/Search_Screen/search_city_screen.dart';
import 'package:wheather/const/Colors.dart';
import 'package:wheather/const/text_styles.dart';
import 'package:wheather/const/wheather_gradiant_background.dart';
import 'package:wheather/widgets/home_appbar.dart';
import 'package:wheather/widgets/home_item_llist.dart';

class main_screen extends StatefulWidget {
  const main_screen({
    super.key,
  });

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CityInfoBloc>(context).add(CityInfogetdataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        BlocBuilder<CityInfoBloc, CityinfoState>(builder: (context, state) {
      return Stack(children: [
        Container(
          decoration: BoxDecoration(gradient: wheather_gradiaant()),
        ),
        CustomScrollView(
          slivers: [
            if (state is CityInfoLoadingState) ...{
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    )
                  ],
                ),
              )
            } else if (state is CityInfossuccessState) ...{
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                  child: home_appbar(
                screen: search_citty_screen(),
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                ),
              ),
              state.city_info_list.fold(
                  (error_text) => SliverToBoxAdapter(
                        child: Center(
                            child: Text(
                          error_text.toString(),
                          style: ThemeText.alert_textstyle,
                        )),
                      ), (cityies_list) {
                return SliverList.builder(
                  itemBuilder: (context, index) {
                    return main_item_list(cityies_list[index]);
                  },
                  itemCount: cityies_list.length,
                );
              })
            }
          ],
        )
      ]);
    }));
  }
}
