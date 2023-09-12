import 'package:babel_mate/view/view_barrel_file.dart';

class UserLanguagesSelectionScreen extends StatefulWidget {
  const UserLanguagesSelectionScreen({super.key});

  @override
  State<UserLanguagesSelectionScreen> createState() =>
      _UserLanguagesSelectionScreenState();
}

class _UserLanguagesSelectionScreenState
    extends State<UserLanguagesSelectionScreen> {
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
    var provider =
        Provider.of<UserLanguagesSelectionController>(context, listen: false);
    provider.getLanguagesApi();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
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
                  child: LoadingWidget(
                color: AppColors.secondaryColor,
              ));
            case Status.error:
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                    child: Text(
                  'Try again${value.languages.message}',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                )),
              );
            case Status.completed:
              // Check if any languages are selected
              bool anyLanguagesSelected = value.languages.data?.languages
                      ?.any((language) => language.isSelected ?? false) ??
                  false;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearPercentIndicator(
                    animation: true,
                    animateFromLastPercent: true,
                    backgroundColor: AppColors.onboardPercentIndicatorColor,
                    progressColor: AppColors.secondaryColor,
                    percent: 0.2,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'I Speak',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: value.languages.data!.languages!.length,
                        itemBuilder: (context, index) {
                          var lang = value.languages.data!.languages![index];
                          return GestureDetector(
                              onTap: () => value.toggleLanguageSelection(
                                  lang), // Toggle isSelected
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: lang.isSelected == true
                                        ? const Color.fromARGB(255, 123, 163,
                                            197) // Change color for selected language
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                        Text(
                                          lang.name.toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.done,
                                      color: lang.isSelected == true
                                          ? AppColors
                                              .primaryColor // Change color for selected language
                                          : Colors.white,
                                    ),
                                  ],
                                ),
                              ));
                        }),
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
                          onPress: () => value.printSelectedLanguages(),
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
