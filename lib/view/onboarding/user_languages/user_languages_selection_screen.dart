import 'package:babel_mate/utils/routes/routes_barrel_file.dart';
import 'package:babel_mate/view/view_barrel_file.dart';

class UserLanguagesSelectionScreen extends StatefulWidget {
  const UserLanguagesSelectionScreen({super.key});

  @override
  State<UserLanguagesSelectionScreen> createState() =>
      _UserLanguagesSelectionScreenState();
}

class _UserLanguagesSelectionScreenState
    extends State<UserLanguagesSelectionScreen> {
  @override
  void initState() {
    super.initState();
    var provider =
        Provider.of<UserLanguagesSelectionController>(context, listen: false);
    provider.getLanguagesApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<UserLanguagesSelectionController>(
        builder: (context, value, child) {
          switch (value.languages.status!) {
            case Status.loading:
              return const Center(
                  child: LoadingWidget(color: AppColors.secondaryColor));
            case Status.error:
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                    child: GestureDetector(
                  onTap: () => value.getLanguagesApi(),
                  child: Text(
                    'Try again${value.languages.message}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                )),
              );
            case Status.completed:
              // Check if any languages are selected
              bool anyLanguagesSelected = value.languages.data?.languages
                      ?.any((language) => language.isSelected ?? false) ??
                  false;
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinearPercentIndicatorWidget(percent: 0.2),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('I Speak',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith()),
                      ),
                      Expanded(
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemCount: value.languages.data!.languages!.length,
                            itemBuilder: (context, index) {
                              var lang =
                                  value.languages.data!.languages![index];
                              return GestureDetector(
                                  onTap: () => value.toggleLanguageSelection(
                                      lang), // Toggle isSelected
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        bottom: 10, left: 10, right: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: lang.isSelected == true
                                            ? Color(
                                                0xff4F1F86) // Change color for selected language
                                            : Color(0xff592498),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 10),
                                            Text('🇵🇰'),
                                            SizedBox(width: 10),
                                            Text(lang.name.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith()),
                                          ],
                                        ),
                                        Icon(Icons.done,
                                            color: lang.isSelected == true
                                                ? Colors
                                                    .white // Change color for selected language
                                                : Colors.transparent),
                                      ],
                                    ),
                                  ));
                            }),
                      ),
                    ],
                  ),
                  // Conditionally show/hide the "Continue" button
                  if (anyLanguagesSelected)
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
                            value.printSelectedLanguages();
                            Navigator.pushNamed(context,
                                RouteName.exchangeLanguagesSelectionScreen);
                          },
                        ),
                      ),
                    )
                ],
              );
          }
        },
      ),
    );
  }
}
