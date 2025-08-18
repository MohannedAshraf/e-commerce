import 'package:e_commerce/views/screens/cart_screen.dart';
import 'package:e_commerce/views/screens/home_screen.dart';
import 'package:e_commerce/views/screens/navigation_bar.dart';
import 'package:e_commerce/views/screens/product_details_screen.dart';
import 'package:e_commerce/views/screens/profile_screen.dart';
import 'package:e_commerce/views/screens/sign_up_screen.dart';
import 'package:e_commerce/views/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

    GoRoute(path: '/sign', builder: (context, state) => const SignUpScreen()),

    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),

    GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),

    GoRoute(path: '/nav', builder: (context, state) => const MainNavigation()),
    GoRoute(
      path: '/nav/:index',
      builder: (context, state) {
        final index = int.tryParse(state.pathParameters['index'] ?? '0') ?? 0;
        return MainNavigation(index: index);
      },
    ),

    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),

    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final productId = int.tryParse(state.pathParameters['id'] ?? '');
        if (productId == null) {
          return const HomeScreen();
        }
        return ProductDetailsScreen(id: productId);
      },
    ),
  ],
);
