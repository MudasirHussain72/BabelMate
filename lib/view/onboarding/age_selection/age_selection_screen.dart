import 'package:babel_mate/utils/routes/routes_barrel_file.dart';
import 'package:babel_mate/view/view_barrel_file.dart';
import 'package:babel_mate/view_model/controllers/onboarding/age_selection/age_selection_controller.dart';

class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  State<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AgeSelectionController>(builder: (context, value, child) {
        return Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearPercentIndicatorWidget(percent: 0.8),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('How old are you?',
                      style:
                          Theme.of(context).textTheme.displaySmall!.copyWith()),
                ),
                Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: value.ageRanges.length,
                      itemBuilder: (context, index) {
                        final ageRange = value.ageRanges[index];
                        return GestureDetector(
                          onTap: () {
                            value.selectAgeRange(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 10, left: 10, right: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: ageRange.isSelected
                                  ? const Color(
                                      0xff4F1F86) // Change color for selected age range
                                  : const Color(0xff592498),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(ageRange.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith()),
                                ),
                                Icon(
                                  Icons.done,
                                  color: ageRange.isSelected
                                      ? Colors
                                          .white // Change color for selected age range
                                      : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
            // Conditionally show/hide the "Continue" button
            if (value.selectedAgeRange != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: RoundButton(
                    borderRadius: 50,
                    buttonColor: AppColors.secondaryColor,
                    title: 'Continue',
                    textColor: AppColors.primaryButtonColor,
                    onPress: () {
                      // Handle the continue button press
                      Navigator.pushNamed(
                        context,
                        RouteName.signUpScreen,
                      );
                    },
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
