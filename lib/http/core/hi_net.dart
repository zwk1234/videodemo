import 'package:videoapp/http/core/hi_error.dart';
import 'package:videoapp/http/core/hi_net_adapter.dart';
// import 'package:videoapp/http/core/mock_adapter.dart';
import 'package:videoapp/http/core/dio_adapter.dart';
import 'package:videoapp/http/request/base_request.dart';
import 'package:videoapp/http/core/hi_interceptor.dart';

class HiNet {
  HiNet._();
  static final HiNet _instance = HiNet._();
  factory HiNet() => _instance;
  HiErrorInterceptor? _hiErrorInterceptor;
  static HiNet getInstance() => _instance;

  Future fire(BaseRequest request) async {
    HiNetResponse? response;
    var error;
    try {
      response = await send(request);
    } on HiNetError catch (e) {
      error = e;
      response = e.data;
      printLog(e.message);
    } catch (e) {
      error = e;
      printLog(e);
    }
    if (response == null) {
      print(error);
    }
    var result = response?.data;
    printLog(result);

    var status = response?.statusCode;
    var hiError;
    switch (status) {
      case 200:
        return result;
        break;
      case 401:
        hiError = NeedLogin();
        break;
      case 403:
        hiError = NeedAuth(result.toString(), data: result);
        break;
      default:
        hiError = HiNetError(status!, result.toString(), data: result);
        break;
    }
    //交给拦截器处理错误
    if (_hiErrorInterceptor != null) {
      _hiErrorInterceptor!(hiError);
    }
    throw hiError;
  }

  Future<dynamic> send<T>(BaseRequest request) async {
    printLog('url:${request.url()}');
    //使用mock发送请求
    // HiNetAdapter adapter = MockAdapter();
    //使用dio发送请求
    HiNetAdapter adapter = DioAdapter();
    return adapter.send(request);
  }

  void setErrorInterceptor(HiErrorInterceptor interceptor) {
    this._hiErrorInterceptor = interceptor;
  }

  void printLog(log) {
    print("hi_net:${log.toString()}");
  }
}
