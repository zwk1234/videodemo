// 测试适配器，mock数据

import 'package:videoapp/http/core/hi_net_adapter.dart';
import 'package:videoapp/http/request/base_request.dart';

class MockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<dynamic>> send<T>(BaseRequest request) {
    return Future<HiNetResponse>.delayed(Duration(milliseconds: 1000), () {
      return HiNetResponse(
          data: {"code": 0, "message": 'success'}, statusCode: 403);
    });
  }
}
