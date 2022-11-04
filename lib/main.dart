import 'package:faircomputation/packages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fair Computation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoadingView(),
      getPages: [
        GetPage(name: '/', page: () => const LoadingView()),
        GetPage(name: '/signin', page: () => const LoginView()),
        GetPage(name: '/singup', page: () => const RegisterView()),
        GetPage(name: '/dashboard', page: () => const DashboardView()),
        GetPage(name: '/history', page: () => const HistoryView()),
        GetPage(name: '/about', page: () => const AboutView()),
        GetPage(name: '/profile', page: () => const ProfileView()),
        GetPage(name: '/map', page: () => const MapView()),
      ],
    );
  }
}
