import 'package:dido_koodak1/Model/API/api_result.dart';
import 'package:dido_koodak1/Utils/API/base_http_request_utils.dart';
import 'package:dido_koodak1/Utils/API/web_controllers.dart';
import 'package:dido_koodak1/Utils/API/web_methods.dart';
import 'package:http/http.dart' as http;

class ProjectRequestsUtils extends BaseHttpRequest {




  Future<ApiResult> getAlphabet() async {
    return await makeHttpRequest(
      webMethod: WebMethods.alphabets,
      webController: WebController.games,
      type: 'get',
    );
  }
}
