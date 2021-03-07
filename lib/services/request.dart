import 'config.dart';
import 'package:dio/dio.dart';

class HttpRequest {
  static Future lcRequest(
    url, {
    String method = 'get',
    Map<String, dynamic>? params,
    Interceptor? inter,
  }) async {
    BaseOptions options = BaseOptions(baseUrl: Config.BaseUrl, sendTimeout: Config.timeout, method: method);
    Dio dio = Dio(options);

    // 拦截器
    Interceptor dInter = InterceptorsWrapper(onRequest: (res) {
      print('请求拦截 $res');
      return res;
    }, onError: (res) {
      return res;
    }, onResponse: (res) {
      return res;
    });

    // 设置拦截器可以指定接口拦截
    List<Interceptor> inters = [dInter];
    if (inter != null) inters.add(inter);

    dio.interceptors.addAll(inters);

    try {
      Response res = await dio.request(url, queryParameters: params ??= {});
      return res.data;
    } on DioError catch (e) {
      // 需要这样返回才能 捕捉到错误
      return Future.error(e);
    }
    // request(url,options:options,)
  }
}
