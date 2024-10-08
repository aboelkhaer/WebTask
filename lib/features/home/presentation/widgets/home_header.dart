import '../../../../exports.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      margin: const EdgeInsets.symmetric(horizontal: 80),
      width: double.infinity,
      decoration: const BoxDecoration(
          // color: Colors.red,

          ),
      child: Row(
        children: [
          Image.asset(
            AppImages.appLogo,
            width: 70,
          ),
          const Spacer(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return Row(
                    children: [
                      HomeTabs(
                        isChecked: true,
                        title: 'Items',
                        onTap: () {},
                      ),
                      HomeTabs(
                        isChecked: false,
                        title: 'Pricing',
                        onTap: () {},
                      ),
                      HomeTabs(
                        isChecked: false,
                        title: 'Info',
                        onTap: () {},
                      ),
                      HomeTabs(
                        isChecked: false,
                        title: 'Tasks',
                        onTap: () {},
                      ),
                      HomeTabs(
                        isChecked: false,
                        title: 'Analytics',
                        onTap: () {},
                      ),
                    ],
                  );
                },
                loaded: (homeTabIndex) {
                  return Row(
                    children: [
                      HomeTabs(
                        isChecked: homeTabIndex == 0 ? true : false,
                        title: 'Items',
                        onTap: () {
                          cubit.changeHomeIndex(0);
                        },
                      ),
                      HomeTabs(
                        isChecked: homeTabIndex == 1 ? true : false,
                        title: 'Pricing',
                        onTap: () {
                          cubit.changeHomeIndex(1);
                        },
                      ),
                      HomeTabs(
                        isChecked: homeTabIndex == 2 ? true : false,
                        title: 'Info',
                        onTap: () {
                          cubit.changeHomeIndex(2);
                        },
                      ),
                      HomeTabs(
                        isChecked: homeTabIndex == 3 ? true : false,
                        title: 'Tasks',
                        onTap: () {
                          cubit.changeHomeIndex(3);
                        },
                      ),
                      HomeTabs(
                        isChecked: homeTabIndex == 4 ? true : false,
                        title: 'Analytics',
                        onTap: () {
                          cubit.changeHomeIndex(4);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
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
          ),
          SizedBox(width: 3.w),
          Image.asset(
            AppImages.notification,
            width: 24,
            height: 24,
          ),
          SizedBox(width: 3.w),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: VerticalDivider(
              thickness: 0.26,
            ),
          ),
          SizedBox(width: 3.w),
          // CircleAvatar(
          //   radius: 15,
          //   backgroundColor: AppColors.primary,
          //   child: Image.asset(
          //     AppImages.profile,
          //   ),
          // ),
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(
              AppImages.profile,
            ),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(width: 3.w),
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
      ),
    );
  }
}
