import 'package:faircomputation/packages.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      this.title,
      this.color,
      this.rounded,
      this.icon,
      this.columnGap,
      this.w,
      this.h,
      required this.onPressed})
      : super(key: key);

  final String? title;
  final Color? color;
  final double? rounded;
  final IconData? icon;
  final double? columnGap;
  final double? w;
  final double? h;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(rounded ?? 5),
      onTap: onPressed,
      child: Container(
          width: w ?? Get.width,
          height: h ?? 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(rounded ?? 100)),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(29, 0, 0, 0),
                    blurStyle: BlurStyle.inner,
                    offset: Offset(3, 2),
                    spreadRadius: 2,
                    blurRadius: 5),
              ]),
          child: Container(
            width: w ?? Get.width,
            height: h ?? 50,
            decoration: BoxDecoration(
                color: color ?? Colors.deepPurple,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurStyle: BlurStyle.outer,
                      offset: Offset(-1, -2),
                      spreadRadius: 0.5,
                      blurRadius: 5)
                ],
                borderRadius:
                    BorderRadius.all(Radius.circular(rounded ?? 100))),
            child: Center(
                child: icon == null
                    ? TextWidget.widget(
                        title: title ?? "NOT DEFINED",
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icon,
                            color: Colors.white,
                          ),
                          SizedBox(width: columnGap ?? 5),
                          TextWidget.widget(
                              title: title ?? "NOT DEFINED",
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)
                        ],
                      )),
          )),
    );
  }
}
