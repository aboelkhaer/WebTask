import 'package:web_app_task/exports.dart';

class HomeTabs extends StatelessWidget {
  final bool isChecked;
  final String title;
  final void Function() onTap;
  const HomeTabs({
    super.key,
    required this.isChecked,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: 77,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            Text(
              title,
              style: TextStyle(
                color: isChecked
                    ? const Color(0xFFFFFFFF)
                    : Colors.grey.shade100.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
            Container(
              height: 5,
              width: 40,
              decoration: isChecked
                  ? BoxDecoration(
                      border: const Border(
                        bottom: BorderSide(
                          color: Color(0xFFFFC268),
                          width: 2.5,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    )
                  : const BoxDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
