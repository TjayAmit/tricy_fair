import 'package:faircomputation/packages.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: const Center(child: Text('profile')),
      )),
    );
  }
}
