// ignore_for_file: avoid_classes_with_only_static_members

import '../net/api.dart';
import '../net/market_api.dart';

class VisionRepo {
  static Future fetchMarket() async {
    final response = await http.get('api/external/huobi/market/tickers');
    return response.data['data'];
  }
}
