import '../../../../exports.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    // Determine the horizontal margin based on the screen width
    double horizontalMargin =
        MediaQuery.of(context).size.width > 600 ? 80.0 : 16.0;

    return Container(
      height: 77,
      margin:
          EdgeInsets.symmetric(horizontal: horizontalMargin), // Dynamic margin
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Show drawer icon only on mobile views
          if (MediaQuery.of(context).size.width <= 600) ...[
            const Row(
              children: [
                Icon(Icons.menu, color: Colors.white),
                SizedBox(
                  width: 16,
                )
              ],
            ),
          ],
          Image.asset(
            AppImages.appLogo,
            width: 70,
          ),
          const Spacer(),
          // Show tabs only on larger screens (desktop only)
          if (MediaQuery.of(context).size.width > 600) ...[
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return _buildTabs(true);
                  },
                  loaded: (homeTabIndex) {
                    return _buildTabs(false, homeTabIndex);
                  },
                );
              },
            ),
          ],

          if (MediaQuery.of(context).size.width < 600) ...[
            SizedBox(width: 3.w),
            Image.asset(
              AppImages.setting,
              width: 24,
              height: 24,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Image.asset(
              AppImages.notification,
              width: 24,
              height: 24,
              color: Colors.white,
            ),
          ],

          if (MediaQuery.of(context).size.width > 900) ...[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: VerticalDivider(
                thickness: 0.26,
              ),
            ),
            SizedBox(width: 3.w),
            Image.asset(
              AppImages.setting,
              width: 24,
              height: 24,
              color: Colors.white,
            ),
            SizedBox(width: 3.w),
            Image.asset(
              AppImages.notification,
              width: 24,
              height: 24,
              color: Colors.white,
            ),
          ],
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: VerticalDivider(
              thickness: 0.26,
            ),
          ),
          SizedBox(width: 3.w),
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(
              AppImages.profile,
            ),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(width: 3.w),
          // Show user name only on larger screens
          if (MediaQuery.of(context).size.width > 900) ...[
            const Text(
              'John Doe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
            SizedBox(width: 2.w),
            Image.asset(
              AppImages.downArrow,
              width: 16,
              height: 16,
            ),
          ],
        ],
      ),
    );
  }

  // Method to build the tabs
  Row _buildTabs(bool isDefaultState, [int homeTabIndex = 0]) {
    return Row(
      children: [
        HomeTabs(
          isChecked: isDefaultState ? true : homeTabIndex == 0,
          title: 'Items',
          onTap: () {
            cubit.changeHomeIndex(0);
          },
        ),
        HomeTabs(
          isChecked: isDefaultState ? false : homeTabIndex == 1,
          title: 'Pricing',
          onTap: () {
            cubit.changeHomeIndex(1);
          },
        ),
        HomeTabs(
          isChecked: isDefaultState ? false : homeTabIndex == 2,
          title: 'Info',
          onTap: () {
            cubit.changeHomeIndex(2);
          },
        ),
        HomeTabs(
          isChecked: isDefaultState ? false : homeTabIndex == 3,
          title: 'Tasks',
          onTap: () {
            cubit.changeHomeIndex(3);
          },
        ),
        HomeTabs(
          isChecked: isDefaultState ? false : homeTabIndex == 4,
          title: 'Analytics',
          onTap: () {
            cubit.changeHomeIndex(4);
          },
        ),
      ],
    );
  }
}
