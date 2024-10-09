import 'package:google_fonts/google_fonts.dart';
import 'package:web_app_task/features/home/data/models/trip_model_response.dart';

import '../../../../../../exports.dart';

class TripCard extends StatelessWidget {
  final TripModel tripModel;
  final double cardWidth;
  final bool isMobile;

  const TripCard({
    super.key,
    required this.tripModel,
    required this.cardWidth,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    // Adjust card height based on screen size
    double cardHeight = isMobile ? cardWidth * 0.8 : cardWidth * 1.1;

    return Container(
      width: cardWidth,
      height: cardHeight,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            // Background Image
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Container(
                    height: cardHeight * 0.5,
                    width: cardWidth - 1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(tripModel.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Gradient Overlay
            Container(
              height: cardHeight * 0.51, // Same height as the image
              width: cardWidth,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF262626),
                    Colors.transparent,
                  ],
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
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.orange.shade800.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text('Pending Approval',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w200,
                                    )),
                              ),
                              const SizedBox(width: 8),
                              Image.asset(
                                AppImages.downArrow,
                                width: 10,
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          tripModel.title.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Image.asset(
                              AppImages.calendar,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(width: 2),
                            Flexible(
                              child: Text(
                                tripModel.date.toString(),
                                style: const TextStyle(
                                  color: Colors.white54,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                ),
                                maxLines: 1,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Stack(
                                    children: [
                                      const CircleAvatar(
                                        radius: 14,
                                        backgroundImage: AssetImage(
                                            'assets/images/person1.png'),
                                      ),
                                      const Positioned(
                                        left: 15,
                                        child: CircleAvatar(
                                          radius: 14,
                                          backgroundImage: AssetImage(
                                              'assets/images/person2.png'),
                                        ),
                                      ),
                                      tripModel.isWithSix!
                                          ? const Positioned(
                                              left: 30,
                                              child: CircleAvatar(
                                                radius: 14,
                                                backgroundImage: AssetImage(
                                                    'assets/images/person3.png'),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      tripModel.isWithSix!
                                          ? Positioned(
                                              left: 45,
                                              child: CircleAvatar(
                                                radius: 14,
                                                backgroundColor:
                                                    const Color(0xFF262626),
                                                child: Text(
                                                  '+6',
                                                  style: GoogleFonts.inter(
                                                    color:
                                                        const Color(0xFFFFC268),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 4),
                            const Flexible(
                              child: Text(
                                '4 unfinished tasks',
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 13,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1,
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
