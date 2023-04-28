class SocialMediaModel{

  String? facebook,instagram,linkedin,mail;

  SocialMediaModel({this.facebook, this.instagram, this.linkedin, this.mail});


  isFacebook() => facebook!.isEmpty? false:true;
  isInstagram() => instagram!.isEmpty? false:true;
  isLinkedin() => linkedin!.isEmpty? false:true;
  isMail() => mail!.isEmpty? false:true;

  getIconFacebook()=>_getPath(iconName: 'facebook');
  getIconInstagram()=>_getPath(iconName: 'instagram');
  getIconLinkedin()=>_getPath(iconName: 'linkedin');
  getIconMail()=>_getPath(iconName: 'mail');

  _getPath({required String iconName}) => 'assets/icons/${iconName}.png';

}