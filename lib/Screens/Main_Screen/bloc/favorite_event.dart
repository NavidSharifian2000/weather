abstract class CityInfoEvent {}

class CityInfogetdataEvent extends CityInfoEvent {}

class CityInfodeletedataEvent extends CityInfoEvent {
  String cityname;
  CityInfodeletedataEvent(this.cityname);
}
