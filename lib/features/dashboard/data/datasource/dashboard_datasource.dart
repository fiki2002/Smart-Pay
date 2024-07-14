import 'package:smart_pay/core/core.dart';

abstract class DashboardDatasource {
  Future<String> fetchSecretMessage();
}

class DashboardDatasourceImpl extends DashboardDatasource {
  final HttpHelper _httpHelper = getIt<HttpHelper>();

  @override
  Future<String> fetchSecretMessage() async {
    final res = await _httpHelper.get(dashboardUrl);

    return res['data']['secret'];
  }
}
