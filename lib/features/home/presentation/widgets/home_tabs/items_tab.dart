import 'package:web_app_task/exports.dart';
import 'package:web_app_task/features/home/presentation/widgets/home_tabs/widgets/trip_card.dart';

class ItemsTab extends StatelessWidget {
  const ItemsTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    double horizontalMargin =
        MediaQuery.of(context).size.width > 600 ? 80.0 : 16.0;

    return FadeIn(
      child: Column(
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
            child: Row(
              children: [
                const Text(
                  'Items',
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
                    if (MediaQuery.of(context).size.width > 900) ...[
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 10),
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
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width > 600 ? 80 : 16,
            ),
            width: double.infinity,
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Determine if the screen is mobile
                bool isMobile = MediaQuery.of(context).size.width <= 600;

                // Determine the number of cards per row based on available width
                int cardsPerRow;
                if (constraints.maxWidth > 1200) {
                  cardsPerRow = 5; // 5 cards for large screens
                } else if (constraints.maxWidth > 900) {
                  cardsPerRow = 4; // 4 cards for medium screens
                } else if (constraints.maxWidth > 600) {
                  cardsPerRow = 2; // Change this to 2 cards for small screens
                } else {
                  cardsPerRow = 1; // 1 card for mobile
                }

                // Calculate card width dynamically
                double cardWidth =
                    (constraints.maxWidth - (cardsPerRow - 1) * 16) /
                        cardsPerRow; // Subtract spacing

                return Wrap(
                  spacing: 16, // Horizontal space between cards
                  runSpacing: 10, // Vertical space between cards
                  alignment:
                      WrapAlignment.start, // Align the cards at the start
                  children: List.generate(
                    cubit.trips.length,
                    (index) {
                      return TripCard(
                        tripModel: cubit.trips[index],
                        cardWidth: cardWidth, // Pass the calculated card width
                        isMobile: isMobile, // Pass isMobile flag
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
