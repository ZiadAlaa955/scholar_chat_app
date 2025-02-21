import 'package:go_router/go_router.dart';
import 'package:scholar_chat_app/Views/chat_view.dart';
import 'package:scholar_chat_app/Views/sign_in_view.dart';
import 'package:scholar_chat_app/Views/sign_up_view.dart';

String signIn = '/';
String signUp = '/signupView';
String chat = '/chatView';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: signIn,
      builder: (context, state) => SignInView(),
    ),
    GoRoute(
      path: signUp,
      builder: (context, state) => SignUpView(),
    ),
    GoRoute(
      path: chat,
      builder: (context, state) => ChatView(
        email: state.extra as String,
      ),
    ),
  ],
);
