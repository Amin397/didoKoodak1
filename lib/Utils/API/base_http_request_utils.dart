import 'dart:convert';
import 'dart:io';

import 'package:dido_koodak1/Utils/API/web_controllers.dart';
import 'package:dido_koodak1/Utils/API/web_methods.dart';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import '../../Model/API/api_result.dart';

class BaseHttpRequest {
  static BaseHttpRequest instance = BaseHttpRequest();

  static String token = 'test';
  static String baseRequestUrl = '192.168.88.220:8000';

  Future<ApiResult> makeHttpRequest({
    WebMethods? webMethod,
    required WebController webController,
    WebController? optionalWebMethod,
    String? pathVariable,
    Object body = const {},
    Map<String, String> headers = const {},
    Map<String, dynamic>? queryParameters,
    required String type,
  }) async {
    ApiResult response = ApiResult(
      isDone: true,
      requestedMethod: webMethod.toString(),
    );

    // print('-----');
    // print(makePath(
    //   webController: webController,
    //   webMethod: webMethod,
    //   optionalController: optionalWebMethod,
    //   pathVariable: pathVariable,
    //   queryParameters: queryParameters,
    // ));
    // print('-----');
    // print('Path: \n');
    //
    // print(makePath(
    //   webController: webController,
    //   webMethod: webMethod,
    //   optionalController: optionalWebMethod,
    //   pathVariable: pathVariable,
    //   queryParameters: queryParameters,
    // ).toString().replaceAll('-', '_'));
    //
    // print('body: \n');
    // print(body);
    //
    // print('header: \n');
    // print(headers);
    //
    // print('type: \n');
    // print(type);

    switch (type) {
      case 'post':
        {
          try {
            response.data = await http
                .post(
              makePath(
                webMethod: webMethod,
                webController: webController,
                optionalController: optionalWebMethod,
                pathVariable: pathVariable,
                queryParameters: queryParameters,
              ),
              body: body,
              headers: headers,
            )
                .timeout(const Duration(seconds: 40), onTimeout: () {
              // ViewUtils.showError(errorMessage: 'Something went wrong');
              return http.Response('Error', 600);
            });
          } catch (e) {
            print(e);
          }

          break;
        }
      case 'put':
        {
          try {
            response.data = await http
                .put(
              makePath(
                webMethod: webMethod,
                webController: webController,
                optionalController: optionalWebMethod,
                pathVariable: pathVariable,
                queryParameters: queryParameters,
              ),
              body: body,
              headers: headers,
            )
                .timeout(const Duration(seconds: 40), onTimeout: () {
              // ViewUtils.showError(errorMessage: 'Something went wrong');
              return http.Response('Error', 600);
            });
          } catch (e) {
            print(e);
          }
          break;
        }
      case 'patch':
        {
          try {
            response.data = await http
                .patch(
              makePath(
                webMethod: webMethod,
                webController: webController,
                optionalController: optionalWebMethod,
                pathVariable: pathVariable,
                queryParameters: queryParameters,
              ),
              body: body,
              headers: headers,
            )
                .timeout(const Duration(seconds: 40), onTimeout: () {
              // ViewUtils.showError(errorMessage: 'Something went wrong');
              return http.Response('Error', 600);
            });
          } catch (e) {
            print(e);
          }
          break;
        }
      case 'get':
        {
          try {
            response.data = await http
                .get(
              makePath(
                webMethod: webMethod,
                webController: webController,
                optionalController: optionalWebMethod,
                pathVariable: pathVariable,
                queryParameters: queryParameters,
              ),
              headers: headers,
            )
                .timeout(const Duration(seconds: 40), onTimeout: () {
              return http.Response('Request time out', 600);
            });

            response.data = jsonDecode(response.data.body);


          } catch (e) {
            print(e);
          }
          break;
        }
      case 'delete':
        {
          try {
            response.data = await http
                .delete(
              makePath(
                webMethod: webMethod,
                webController: webController,
                optionalController: optionalWebMethod,
                pathVariable: pathVariable,
                queryParameters: queryParameters,
              ),
              headers: headers,
            )
                .timeout(const Duration(seconds: 40), onTimeout: () {
              return http.Response('Request time out', 600);
            });
          } catch (e) {
            print(e);
          }
          break;
        }
    }

    print('status Code: \n');
    print(response.status);

    print('response body: \n');
    print(response.data);

    return response;
  }

  Future<http.Response> makeFileHttpRequest({
    required WebMethods webMethod,
    required WebController webController,
    WebController? optionalWebController,
    String headers = '',
    required String type,
    String? pathVariable,
    String? filePath,
    Map<String, dynamic>? queryParameters,
  }) async {
    late http.MultipartRequest request;
    late http.StreamedResponse response1;
    late http.Response response;

    print('Path: \n');
    print(makePath(webController: webController, webMethod: webMethod)
        .toString()
        .replaceAll('_', '-'));

    print('header: \n');
    print(headers);

    print('type: \n');
    print(type);

    switch (type) {
      case 'post':
        {
          break;
        }
      case 'put':
        {
          request = http.MultipartRequest(
            type.toUpperCase(),
            makePath(
              webMethod: webMethod,
              webController: webController,
              optionalController: optionalWebController,
              pathVariable: pathVariable,
              queryParameters: queryParameters,
            ),
          );
          request.headers['Authorization'] = headers;
          request.files.add(
            await http.MultipartFile.fromPath(
              'profile_picture',
              filePath!,
            ),
          );
          try {
            response1 = await request.send();
            response = await http.Response.fromStream(response1);
          } catch (e) {
            print(e);
          }

          // try {
          //   response = await http.put(
          //     makePath(
          //       webMethod: webMethod,
          //       webController: webController,
          //     ),
          //     body: body,
          //     headers: headers,
          //   );
          // } catch (e) {
          //   print(e);
          // }
          break;
        }
      case 'patch':
        {
          // try {
          //   response = await http.patch(
          //     makePath(
          //       webMethod: webMethod,
          //       webController: webController,
          //     ),
          //     body: body,
          //     headers: headers,
          //   );
          // } catch (e) {
          //   print('TTTTTTTTTTTTTTTTTTTTTTT');
          //   print(e);
          // }
          break;
        }
      case 'get':
        {
          break;
        }
    }

    print('status Code: \n');
    print(response.statusCode);

    print('response body: \n');
    print(response.body);

    return response;
  }

  static Uri makePath({
    required WebController webController,
    WebMethods? webMethod,
    WebController? optionalController,
    String? pathVariable,
    Map<String, dynamic>? queryParameters,
  }) {
    Uri requestPath;

    if (optionalController != null) {
      if (pathVariable != null) {
        if (webMethod != null) {
          if (queryParameters != null) {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${optionalController.name}/${webController.name}/${webMethod.name}/$pathVariable/'
                    .replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${optionalController.name}/${webController.name}/${webMethod.name}/$pathVariable/'
                    .replaceAll('_', '-'));
          }
        } else {
          if (queryParameters != null) {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${optionalController.name}/${webController.name}/$pathVariable/'
                    .replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${optionalController.name}/${webController.name}/$pathVariable/'
                    .replaceAll('_', '-'));
          }
        }
      } else {
        if (webMethod != null) {
          if (queryParameters != null) {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${optionalController.name}/${webController.name}/${webMethod.name}/'
                    .replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${optionalController.name}/${webController.name}/${webMethod.name}/'
                    .replaceAll('_', '-'));
          }
        } else {
          if (queryParameters != null) {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${optionalController.name}/${webController.name}/'
                    .replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${optionalController.name}/${webController.name}/'
                    .replaceAll('_', '-'));
          }
        }
      }
    } else {
      if (pathVariable != null) {
        if (webMethod != null) {
          if (queryParameters != null) {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${webController.name}/${webMethod.name}/$pathVariable/'
                    .replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${webController.name}/${webMethod.name}/$pathVariable/'
                    .replaceAll('_', '-'));
          }
        } else {
          if (queryParameters != null) {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${webController.name}/$pathVariable/'.replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(baseRequestUrl,
                '/${webController.name}/$pathVariable/'.replaceAll('_', '-'));
          }
        }
      } else {
        if (webMethod != null) {
          if (queryParameters != null) {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${webController.name}/${webMethod.name}/'
                    .replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${webController.name}/${webMethod.name}/'
                    .replaceAll('_', '-'));
          }
        } else {
          if (queryParameters != null) {
            requestPath = Uri.http(
                baseRequestUrl,
                '/${webController.name}/'.replaceAll('_', '-'),
                queryParameters);
          } else {
            requestPath = Uri.http(
                baseRequestUrl, '/${webController.name}/'.replaceAll('_', '-'));
          }
        }
      }
    }

    return requestPath;

    // if (optionalController != null) {
    //   if (pathVariable is String) {
    //     if (webMethod != null) {
    //       return Uri.parse(
    //           '$baseUrl/${optionalController.name}/${webController.name}/${webMethod.name}/$pathVariable/'
    //               .replaceAll('_', '-'));
    //     } else {
    //       return Uri.parse(
    //           '$baseUrl/${optionalController.name}/${webController.name}/$pathVariable/'
    //               .replaceAll('_', '-'));
    //     }
    //   } else {
    //     if (webMethod != null) {
    //       return Uri.parse(
    //           '$baseUrl/${optionalController.name}/${webController.name}/${webMethod.name}/'
    //               .replaceAll('_', '-'));
    //     } else {
    //       return Uri.parse(
    //           '$baseUrl/${optionalController.name}/${webController.name}/'
    //               .replaceAll('_', '-'));
    //     }
    //   }
    // } else {
    //   if (pathVariable is String) {
    //     if (webMethod != null) {
    //       return Uri.parse(
    //           '$baseUrl/${webController.name}/${webMethod.name}/$pathVariable/'
    //               .replaceAll('_', '-'));
    //     } else {
    //       return Uri.parse('$baseUrl/${webController.name}/$pathVariable/'
    //           .replaceAll('_', '-'));
    //     }
    //   } else {
    //     if (webMethod != null) {
    //       return Uri.parse('$baseUrl/${webController.name}/${webMethod.name}/'
    //           .replaceAll('_', '-'));
    //     } else {
    //       return Uri.parse(
    //           '$baseUrl/${webController.name}/'.replaceAll('_', '-'));
    //     }
    //   }
    // }
  }
}
