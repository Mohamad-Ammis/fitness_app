class OnBoardingModel{
  final String title;
  final String subTitle;
  final String? uniqueTitle;
  final bool haveUniqueTitle;
  final String buttonText;
  final String image;
    final void Function()? onTap;

  OnBoardingModel( {required this.image,required this.title, required this.subTitle, required this.uniqueTitle, required this.haveUniqueTitle,required this.buttonText, this.onTap});
}