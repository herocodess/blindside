const String baseImgPath = 'assets/images/';

final String logo = 'blindside_logo'.svg;
final String discover = 'discover'.svg;
final String browse = 'browse'.svg;
final String saved = 'saved'.svg;
final String more = 'more'.svg;
final String football = 'football'.png;
final String football2 = 'football2'.png;
final String football3 = 'football3'.png;
final String maleUser = 'male_user'.png;
final String soccer = 'soccer'.png;
final String moreCircle = 'more_circle'.png;
final String expandImg = 'expand_img'.png;
final String basketball = 'basketball'.png;
final String basketball1 = 'basketball1'.png;
final String basketball2 = 'basketball2'.png;
final String basketball3 = 'basketball3'.png;
final String sendComment = 'send_comment'.png;
final String profileBanner = 'profile_banner'.png;
final String profilePhoto = 'profile_photo'.png;
final String americanFootball = 'american_football'.png;

// extensions
extension ImageExtension on String {
  // get imgs path
  String get svg => '$baseImgPath$this.svg';
  String get png => '$baseImgPath$this.png';
}
