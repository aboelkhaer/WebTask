import 'package:web_app_task/features/home/data/models/trip_model_response.dart';

import '../../../../../../exports.dart';

class TripCard extends StatelessWidget {
  final TripModel tripModel;

  const TripCard({
    super.key,
    required this.tripModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 370,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(8), // Rounded corners
        boxShadow: const [
          BoxShadow(
            color: AppColors.primary,
            blurRadius: 10,
            offset: Offset(0, 4), // Adjust shadow position
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            // Background Image
            Container(
              height: 210,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(tripModel.image
                      .toString()), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Gradient Overlay
            Container(
              height: 210,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF262626),
                    Colors.transparent
                  ], // Gradient overlay
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF171717).withOpacity(0.6),
                      ),
                      child: Image.asset(
                        AppImages.more,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 18,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 2), // Padding inside the button
                          decoration: BoxDecoration(
                            color: Colors
                                .transparent, // Dark background with opacity
                            borderRadius: BorderRadius.circular(
                                20), // Rounded edges to make the pill shape
                            border: Border.all(
                              color: Colors.orange
                                  .withOpacity(0.5), // Border color
                              width: 1, // Border width
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize
                                .min, // To make sure the button takes only as much space as needed
                            children: [
                              const Text(
                                'Pending Approval',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              const SizedBox(
                                  width: 8), // Space between text and icon
                              Image.asset(
                                AppImages.downArrow,
                                width: 8,
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Row(
                          children: [
                            Flexible(
                              child: Text(
                                'Long item Long item title highlighti Loan Lorem',
                                style: TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Image.asset(
                              AppImages.calendar,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(width: 4),
                            const Flexible(
                              child: Text(
                                '5 Nights (Jan 16 - Jan 20, 2024)',
                                style: TextStyle(
                                  color: Colors.white54,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Divider(
                          color: Colors.white30,
                          thickness: 0.2,
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 14,
                                        backgroundImage: AssetImage(
                                          AppImages.person1,
                                        ), // Replace with your user image path
                                      ),
                                      Positioned(
                                        left: 11,
                                        child: CircleAvatar(
                                          radius: 14,
                                          backgroundImage: AssetImage(
                                            AppImages.person2,
                                          ), // Replace with your user image path
                                        ),
                                      ),
                                      Positioned(
                                        left: 24,
                                        child: CircleAvatar(
                                          radius: 14,
                                          backgroundImage: AssetImage(
                                            AppImages.person3,
                                          ), // Replace with your user image path
                                        ),
                                      ),
                                      Positioned(
                                        left: 36,
                                        child: CircleAvatar(
                                          radius: 14,
                                          backgroundColor: Color(0xFF262626),
                                          child: Text(
                                            '+6',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ), // Replace with your user image path
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 4),
                            Text(
                              '4 unfinished tasks',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
