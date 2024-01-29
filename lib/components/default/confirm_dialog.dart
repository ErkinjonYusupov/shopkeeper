import 'package:shopkeeper/config/imports.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog(
      {super.key,
      required this.onTap,
      required this.text,
      required this.title});

  final String title;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    onTap();
                  },
                  child: Text(
                    'Tasdiqlash',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: AppColors.primary),
                  )),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "Bekor qilish",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.red),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
