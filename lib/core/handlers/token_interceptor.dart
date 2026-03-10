import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:eventhub/core/navigation/navigation_service.dart';
import 'package:eventhub/core/router/route_name.dart';
import 'package:eventhub/core/utils/app_helpers.dart';
import 'package:eventhub/core/utils/local_storage.dart';

class TokenInterceptor extends Interceptor {

  TokenInterceptor({required this.requireAuth});
  final bool requireAuth;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = LocalStorage.instance.getAccessToken();
    if (requireAuth && accessToken != null) {
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Clear tokens
      LocalStorage.instance.clearUserSession();
      
      final context = NavigationService.currentContext;
      if (context != null) {
        // Show error message
        AppHelpers.showCheckFlash(
          context,
          'Session expired. Please login again.',
        );

        // Navigate to login
        context.goNamed(RouteName.login);
      }
    }
    return handler.next(err);
  }
}
