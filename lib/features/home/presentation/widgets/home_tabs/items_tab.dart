import 'package:web_app_task/exports.dart';
import 'package:web_app_task/features/home/presentation/widgets/home_tabs/widgets/trip_card.dart';

class ItemsTab extends StatelessWidget {
  const ItemsTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);

    return FadeIn(
      child: Column(
        children: [
          Container(
            height: 65,
            margin: const EdgeInsets.symmetric(horizontal: 80),
            child: Row(
              children: [
                const Text(
                  'Hello',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF171717),
                      ),
                      child: Image.asset(AppImages.sliders),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: VerticalDivider(
                        color: Colors.white12,
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFC268),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                      ),
                      onPressed: () {
                        // Your onPressed logic here
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,
                          ), // Add icon
                          SizedBox(width: 8),
                          Text(
                            'Add new a item',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60),
            child: Wrap(
              spacing: 16,
              runSpacing: 10,
              children: List.generate(
                cubit.trips.length,
                (index) {
                  return TripCard(
                    tripModel: cubit.trips[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
