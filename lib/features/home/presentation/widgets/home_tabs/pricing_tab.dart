import '../../../../../exports.dart';

class PricingTab extends StatelessWidget {
  const PricingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: const Column(
        children: [
          Text(
            'Pricing',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
