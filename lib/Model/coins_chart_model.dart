class CoinsChartModel {
  String? timeOpen;
  String? timeClose;
  double? open;
  double? high;
  double? low;
  double? close;
  int? volume;
  int? marketCap;

  CoinsChartModel(
      {this.timeOpen,
        this.timeClose,
        this.open,
        this.high,
        this.low,
        this.close,
        this.volume,
        this.marketCap});

  CoinsChartModel.fromJson(Map<String, dynamic> json) {
    timeOpen = json['time_open'];
    timeClose = json['time_close'];
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    volume = json['volume'];
    marketCap = json['market_cap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time_open'] = timeOpen;
    data['time_close'] = timeClose;
    data['open'] = open;
    data['high'] = high;
    data['low'] = low;
    data['close'] = close;
    data['volume'] = volume;
    data['market_cap'] = marketCap;
    return data;
  }
}
