import 'package:challenge_dev_flutter/config/api_constants.dart';
import 'package:challenge_dev_flutter/data/repositories/student_repository.dart';
import 'package:challenge_dev_flutter/data/services/student_service.dart';
import 'package:challenge_dev_flutter/ui/home_page/view_model/home_page_view_model.dart';
import 'package:challenge_dev_flutter/ui/home_page/widgets/home_page_screen.dart';
import 'package:challenge_dev_flutter/ui/student_form_page/view_model/student_form_view_model.dart';
import 'package:challenge_dev_flutter/ui/student_form_page/widgets/student_form_screen.dart';
import 'package:challenge_dev_flutter/utils/http_client.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return MultiProvider(
          providers: [
            Provider(
              create: (context) =>
                  HttpClientUtil(baseUrl: ApiConstants.baseUrl),
            ),
            Provider(
              create: (context) =>
                  StudentService(httpClient: context.read<HttpClientUtil>()),
            ),
            Provider(
              create: (context) =>
                  StudentRepository(service: context.read<StudentService>()),
            ),
          ],
          child: Builder(
            builder: (context) {
              final viewModel = HomePageViewModel(
                context.read<StudentRepository>(),
              );

              return HomePageScreen(viewModel: viewModel);
            },
          ),
        );
      },
    ),
    GoRoute(
      path: '/student/:action',
      builder: (context, state) {
        final action = state.pathParameters['action']!;
        final id = state.uri.queryParameters['id'];

        return MultiProvider(
          providers: [
            Provider(
              create: (context) =>
                  HttpClientUtil(baseUrl: ApiConstants.baseUrl),
            ),
            Provider(
              create: (context) =>
                  StudentService(httpClient: context.read<HttpClientUtil>()),
            ),
            Provider(
              create: (context) =>
                  StudentRepository(service: context.read<StudentService>()),
            ),

            ChangeNotifierProvider(
              create: (context) => StudentFormViewModel(
                context.read<StudentRepository>(),
                context: context,
                studentId: id,
                isEditMode: action == 'edit',
              ),
            ),
          ],
          child: const StudentFormScreen(),
        );
      },
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
