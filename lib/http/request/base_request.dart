enum HttpMethod { GET, POST, DELETE }

//基础请求
abstract class BaseRequest {
  //curl -X GET "https://api.devio.org/uapi/test/test?requestParams=11" -H "accept:*/*"
  //curl -X GET "http://api.devio.org/uapi/test/test/1"
  var pathParams;
  var useHttps = true;
  String authority() {
    return "api.devio.org";
  }

  HttpMethod httpMethod();
  String path();
  String url() {
    Uri uri;
    var pathStr = path();
    //拼接path参数
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }
    //http和https切换
    if (useHttps) {
      uri = Uri.https(authority(), pathStr, pathParams);
    } else {
      uri = Uri.http(authority(), pathStr, pathParams);
    }
    print("url:${uri.toString()}");
    return uri.toString();
  }
}
