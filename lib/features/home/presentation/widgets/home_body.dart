import 'package:web_app_task/exports.dart';
import 'package:web_app_task/features/home/presentation/widgets/home_tabs/analytics_tab.dart';
import 'package:web_app_task/features/home/presentation/widgets/home_tabs/info_tab.dart';
import 'package:web_app_task/features/home/presentation/widgets/home_tabs/items_tab.dart';
import 'package:web_app_task/features/home/presentation/widgets/home_tabs/pricing_tab.dart';
import 'package:web_app_task/features/home/presentation/widgets/home_tabs/tasks_tab.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                    loaded: (homeTabIndex) {
                      if (homeTabIndex == 0) {
                        return const ItemsTab();
                      }
                      if (homeTabIndex == 1) {
                        return const PricingTab();
                      }
                      if (homeTabIndex == 2) {
                        return const InfoTab();
                      }
                      if (homeTabIndex == 3) {
                        return const TasksTab();
                      }
                      if (homeTabIndex == 4) {
                        return const AnalyticsTab();
                      }
                      return Container();
                    },
                  );
                },
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
