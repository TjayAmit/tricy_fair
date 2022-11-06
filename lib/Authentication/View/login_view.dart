import 'package:faircomputation/packages.dart';

class LoginView extends GetView<Authentication> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Flexible(
                flex: 2,
                child: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_pin,
                            color: Colors.deepOrange,
                            size: 50,
                          ),
                          TextWidget.widget(
                              title: 'Tri',
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepOrange),
                          TextWidget.widget(
                              title: 'Sakay',
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurple),
                        ],
                      ),
                    ],
                  ),
                )),
            Flexible(
                flex: 4,
                child: SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                        child: Form(
                            child: Column(
                          children: [
                            Row(children: [
                              ContainerWidget(
                                  w: 90,
                                  h: 30,
                                  rounded: 30,
                                  color: Colors.deepPurple,
                                  child: Center(
                                      child: TextWidget.widget(
                                          title: "Signin",
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500))),
                            ]),
                            const SizedBox(height: 25),
                            FormWidget(
                              controller: controller.email,
                              title: "Email",
                              iconData: Icons.email,
                            ),
                            const SizedBox(height: 25),
                            FormWidget(
                                controller: controller.password,
                                title: 'Password',
                                iconData: Icons.lock),
                            const SizedBox(height: 20),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(color: Colors.grey),
                                )),
                            const SizedBox(height: 20),
                            ButtonWidget(
                              onPressed: () {
                                controller.signin();
                              },
                              title: "Sign in",
                              color: Colors.deepPurple,
                              rounded: 100,
                            ),
                            const SizedBox(height: 15),
                            ButtonWidget(
                              onPressed: () {
                                Get.toNamed('/register');
                              },
                              title: "Sign up",
                              color: Colors.deepOrange,
                              rounded: 100,
                            ),
                          ],
                        )),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    )));
  }
}
