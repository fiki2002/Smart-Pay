import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smart_pay/core/core.dart';

class HttpHelper {
  late final SessionManager _sessionManager;

  HttpHelper() {
    _sessionManager = getIt<SessionManager>();
  }

  Future<Map<String, String>> _getHeaders() async {
    final String token = await _getToken();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<String> _getToken() async {
    try {
      final String token = await _sessionManager.getToken();
      return token;
    } catch (e) {
      return '';
    }
  }

  Future<Map<String, dynamic>> get(
    String url, {
    Uri? uri,
    Map<String, dynamic>? query,
  }) async {
    final headers = await _getHeaders();

    final completeUrl = _buildUrl(url, query);

    AppLogger.log('URL: $completeUrl');

    return _handleRequest(
      () async {
        final response = await http
            .get(uri ?? Uri.parse(completeUrl), headers: headers)
            .timeout(
              const Duration(minutes: 5),
            );
        return _processResponse(response, url);
      },
    );
  }

  Future<Map<String, dynamic>> post({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? header,
    Map<String, dynamic>? query,
  }) async {
    final headers = await _getHeaders();

    AppLogger.log('HEADERS:: $headers');

    return _handleRequest(
      () async {
        final completeUrl = _buildUrl(url, query);

        AppLogger.log('Url:  $completeUrl');

        AppLogger.log('BODY:  $body QUERY: $query');

        final response = await http
            .post(
              Uri.parse(completeUrl),
              headers: header ?? headers,
              body: json.encode(body ?? {}),
            )
            .timeout(const Duration(minutes: 5));
        return _processResponse(response, url);
      },
    );
  }

  Future<Map<String, dynamic>> put({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    final headers = await _getHeaders();

    AppLogger.log('Url:  $url');

    return _handleRequest(
      () async {
        final response = await http
            .put(
              Uri.parse(url),
              headers: header ?? headers,
              body: json.encode(body ?? {}),
            )
            .timeout(const Duration(minutes: 5));
        return _processResponse(response, url);
      },
    );
  }

  Future<Map<String, dynamic>> patch({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    final headers = await _getHeaders();

    AppLogger.log('Url:  $url');

    return _handleRequest(
      () async {
        final response = await http
            .patch(
              Uri.parse(url),
              headers: header ?? headers,
              body: json.encode(body ?? {}),
            )
            .timeout(const Duration(minutes: 5));
        return _processResponse(response, url);
      },
    );
  }

  Future<Map<String, dynamic>> _handleRequest(
    Future<Map<String, dynamic>> Function() request,
  ) async {
    try {
      return await request();
    } on TypeError catch (e, s) {
      AppLogger.log(e, s);
      _handleError(ErrorText.somethingWentWrong);
    } on HandshakeException catch (e, s) {
      AppLogger.log(e, s);

      _handleError(ErrorText.unableToConnect);
    } on FormatException catch (e, s) {
      AppLogger.log(e, s);

      _handleError(ErrorText.formatError);
    } on TimeoutException catch (e, s) {
      AppLogger.log(e, s);

      _handleError(ErrorText.timeOutError);
    } on SocketException catch (e, s) {
      AppLogger.log(e, s);

      _handleError(ErrorText.unableToConnect);
    } catch (e) {
      _handleError(e.toString());
    }
    return {};
  }

  void _handleError(String error) {
    AppLogger.log(error);

    throw error;
  }

  String _buildUrl(String url, Map<String, dynamic>? query) {
    if (query != null) {
      url += '?';
      query.forEach((key, value) {
        url += '&$key=$value';
      });
    }
    return url;
  }

  Map<String, dynamic> _processResponse(http.Response response, String url) {
    AppLogger.log(
      'Response Body from Http Helper from  $url ${response.body} ',
    );
    AppLogger.log('Status Code from Http Helper ${response.statusCode}');

    final Map<String, dynamic> result = json.decode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return result;
    } else {
      throw checkForError(result);
    }
  }

  static String checkForError(Map<String, dynamic> data) {
    if (data['status'] == 'false' || data['status'] == false) {
      final String? message = data['message'] ?? data['error'];

      AppLogger.log('Error message from Http Helper:$message');

      if (message != null) {
        if (message.contains("Can't find /api/v1/")) {
          return "Unable to connect to server, contact support";
        }
        if (message == 'The given data was invalid.') {
          if ((data['errors']['email'] as List<dynamic>?)?.isNotEmpty ??
              false) {
            return data['errors']['email'][0];
          } else {
            return message;
          }
        }
        return message;
      }

      final Map<String, dynamic> errorMap = Map.from(data['msg']);

      return errorMap.values.join('\n');
    }

    return ErrorText.somethingWentWrong;
  }
}
