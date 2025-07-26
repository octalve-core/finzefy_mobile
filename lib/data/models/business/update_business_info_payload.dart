class UpdateBusinessInfoPayload {
String businessName;
String businessAddress;
String businessDescription;
String rcNumber;
String taxId;
String? instagramProfile;
String? facebookProfile;
String? twitterProfile;
String? websiteLink;
String digitalSignature;

UpdateBusinessInfoPayload({
  required this.businessName,
  required this.businessAddress,
  required this.businessDescription,
  required this.rcNumber,
  required this.taxId,
  required this.digitalSignature,
  this.instagramProfile,
  this.facebookProfile,
  this.twitterProfile,
  this.websiteLink
});

  Map<String, dynamic> toJson(){
    return {
     'businessName' : businessName,
     'businessAddress' : businessAddress,
     'businessDescription' : businessDescription,
     'rcNumber' : rcNumber,
     'taxId' : taxId,
     'digitalSignature' : digitalSignature,
     'instagramProfile' : instagramProfile,
     'facebookProfile' : facebookProfile,
     'twitterProfile' : twitterProfile,
     'websiteLink' : websiteLink
    };
  }
}