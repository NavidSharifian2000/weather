extension convertkeltocel on double {
  double parcekeltocel() {
    double cantigrad = (this - 273.15).roundToDouble();
    return cantigrad;
  }
}
