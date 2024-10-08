import 'package:web_app_task/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().initHomeIndex();
  }

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          HomeHeader(cubit: cubit),
          Container(
            decoration: BoxDecoration(
              // color: Colors.red,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade100,
                  width: 0.2,
                ),
              ),
            ),
          ),
          const HomeBody(),
        ],
      ),
    );
  }
}
