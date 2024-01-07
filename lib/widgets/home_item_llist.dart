import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather/Screens/Main_Screen/bloc/favorite_bloc.dart';
import 'package:wheather/Screens/Main_Screen/bloc/favorite_event.dart';
import 'package:wheather/Screens/Main_Screen/data/model/faforite_city_model.dart';
import 'package:wheather/const/Colors.dart';
import 'package:wheather/const/text_styles.dart';
import 'package:wheather/utils/extentions/string_extentions.dart';

class main_item_list extends StatelessWidget {
  city_info city_information;
  main_item_list(
    this.city_information, {
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.5, color: CustomColors.whitetext))),
        width: MediaQuery.of(context).size.width,
        height: 190,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      BlocProvider.of<CityInfoBloc>(context).add(
                          CityInfodeletedataEvent(
                              city_information.name.toString()));
                    },
                    child: Image.asset("assets/images/delete.png"))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        city_information.temp!.parcekeltocel().toString(),
                        style: ThemeText.home_temp_itemlist_textstyle,
                      ),
                      Text(
                        city_information.name.toString(),
                        style: ThemeText.home_name_itemlist_textstyle,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        city_information.time.toString(),
                        style: ThemeText.home_time_itemlist_textstyle,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          child: Image.network(
                              city_information.urlicon.toString())),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        city_information.main.toString(),
                        style: TextStyle(color: CustomColors.whitetext),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
