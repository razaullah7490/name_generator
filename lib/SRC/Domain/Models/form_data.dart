class FormsDataa {
  List<String>? topicOptions;
  List<String>? targetAudienceOptions;
  List<String>? keywordPhrasesOptions;
  List<String>? themeOptionsBook;
  List<String>? keywordOptions;
  List<String>? toneOptionsBook;
  List<String>? gender;
  List<String>? region;
  List<String>? nameStyle;
  List<String>? flavour;
  List<String>? charType;
  List<String>? letter;
  List<String>? type;
  List<String>? cookingStyle;
  List<String>? texture;
  List<String>? taste;
  List<String>? ingredient;
  List<String>? cusineRegion;
  List<String>? nameLength;
  List<String>? gamingNameThemesOptions;
  List<String>? gameOptions;
  List<String>? religion;
  List<String>? country;
  List<String>? personality;
  List<String>? dob;
  List<String>? name;
  List<String>? petType;
  List<String>? themeDog;
  List<String>? productTypeOptions;
  List<String>? targetAudienceOptionss;
  List<String>? productFeatures;
  List<String>? styleOrToneProdu;
  List<String>? pr;
  List<String>? domainOptions;
  List<String>? geographicFocus;
  List<String>? themeStory;
  List<String>? element;
  List<String>? mood;
  List<String>? numMembers;
  List<String>? themeTeam;
  List<String>? title;
  List<String>? typeOfWork;
  List<String>? subject;
  List<String>? keywordIdeas;
  List<String>? toneStyleTitle;
  List<String>? twinsGender;
  List<String>? namingStyle;
  List<String>? background;

  FormsDataa({
    this.topicOptions,
    this.targetAudienceOptions,
    this.keywordPhrasesOptions,
    this.themeOptionsBook,
    this.keywordOptions,
    this.toneOptionsBook,
    this.gender,
    this.region,
    this.nameStyle,
    this.flavour,
    this.charType,
    this.letter,
    this.type,
    this.cookingStyle,
    this.texture,
    this.taste,
    this.ingredient,
    this.cusineRegion,
    this.nameLength,
    this.gamingNameThemesOptions,
    this.gameOptions,
    this.religion,
    this.country,
    this.personality,
    this.dob,
    this.name,
    this.petType,
    this.themeDog,
    this.productTypeOptions,
    this.targetAudienceOptionss,
    this.productFeatures,
    this.styleOrToneProdu,
    this.pr,
    this.domainOptions,
    this.geographicFocus,
    this.themeStory,
    this.element,
    this.mood,
    this.numMembers,
    this.themeTeam,
    this.title,
    this.typeOfWork,
    this.subject,
    this.keywordIdeas,
    this.toneStyleTitle,
    this.twinsGender,
    this.namingStyle,
    this.background,
  });

  FormsDataa.fromJson( json)
      : topicOptions = _convertToStringList(json['topic_options']),
        targetAudienceOptions =
            _convertToStringList(json['target_audience_options']),
        keywordPhrasesOptions =
            _convertToStringList(json['keyword_phrases_options']),
        themeOptionsBook = _convertToStringList(json['theme_options_book']),
        keywordOptions = _convertToStringList(json['keyword_options']),
        toneOptionsBook = _convertToStringList(json['tone_options_book']),
        gender = _convertToStringList(json['gender']),
        region = _convertToStringList(json['region']),
        nameStyle = _convertToStringList(json['name_style']),
        flavour = _convertToStringList(json['flavour']),
        charType = _convertToStringList(json['charType']),
        letter = _convertToStringList(json['letter']),
        type = _convertToStringList(json['type']),
        cookingStyle = _convertToStringList(json['cookingStyle']),
        texture = _convertToStringList(json['texture']),
        taste = _convertToStringList(json['taste']),
        ingredient = _convertToStringList(json['ingredient']),
        cusineRegion = _convertToStringList(json['cusineRegion']),
        nameLength = _convertToStringList(json['nameLength']),
        gamingNameThemesOptions =
            _convertToStringList(json['gamingNameThemesOptions']),
        gameOptions = _convertToStringList(json['gameOptions']),
        religion = _convertToStringList(json['religion']),
        country = _convertToStringList(json['country']),
        personality = _convertToStringList(json['personality']),
        dob = _convertToStringList(json['dob']),
        name = _convertToStringList(json['name']),
        petType = _convertToStringList(json['pet_type']),
        themeDog = _convertToStringList(json['theme_dog']),
        productTypeOptions = _convertToStringList(json['product_type_options']),
        targetAudienceOptionss =
            _convertToStringList(json['target_audience_optionss']),
        productFeatures = _convertToStringList(json['product_features']),
        styleOrToneProdu = _convertToStringList(json['style_or_tone_produ']),
        pr = _convertToStringList(json['pr']),
        domainOptions = _convertToStringList(json['domain_options']),
        geographicFocus = _convertToStringList(json['geographic_focus']),
        themeStory = _convertToStringList(json['theme_story']),
        element = _convertToStringList(json['element']),
        mood = _convertToStringList(json['mood']),
        numMembers = _convertToStringList(json['num_members']),
        themeTeam = _convertToStringList(json['theme_team']),
        title = _convertToStringList(json['title']),
        typeOfWork = _convertToStringList(json['typeOfWork']),
        subject = _convertToStringList(json['subject']),
        keywordIdeas = _convertToStringList(json['keyword_ideas']),
        toneStyleTitle = _convertToStringList(json['tone_style_title']),
        twinsGender = _convertToStringList(json['twinsGender']),
        namingStyle = _convertToStringList(json['naming_style']),
        background = _convertToStringList(json['background']);

  Map<String, dynamic> toJson() {
    return {
      'topic_options': topicOptions,
      'target_audience_options': targetAudienceOptions,
      'keyword_phrases_options': keywordPhrasesOptions,
      'theme_options_book': themeOptionsBook,
      'keyword_options': keywordOptions,
      'tone_options_book': toneOptionsBook,
      'gender': gender,
      'region': region,
      'name_style': nameStyle,
      'flavour': flavour,
      'charType': charType,
      'letter': letter,
      'type': type,
      'cookingStyle': cookingStyle,
      'texture': texture,
      'taste': taste,
      'ingredient': ingredient,
      'cusineRegion': cusineRegion,
      'nameLength': nameLength,
      'gamingNameThemesOptions': gamingNameThemesOptions,
      'gameOptions': gameOptions,
      'religion': religion,
      'country': country,
      'personality': personality,
      'dob': dob,
      'name': name,
      'pet_type': petType,
      'theme_dog': themeDog,
      'product_type_options': productTypeOptions,
      'target_audience_optionss': targetAudienceOptionss,
      'product_features': productFeatures,
      'style_or_tone_produ': styleOrToneProdu,
      'pr': pr,
      'domain_options': domainOptions,
      'geographic_focus': geographicFocus,
      'theme_story': themeStory,
      'element': element,
      'mood': mood,
      'num_members': numMembers,
      'theme_team': themeTeam,
      'title': title,
      'typeOfWork': typeOfWork,
      'subject': subject,
      'keyword_ideas': keywordIdeas,
      'tone_style_title': toneStyleTitle,
      'twinsGender': twinsGender,
      'naming_style': namingStyle,
      'background': background,
    };
  }

static List<String>? _convertToStringList(dynamic jsonList) {
    if (jsonList != null) {
      List<String> stringList = [];
      for (var item in jsonList) {
        stringList.add(item.toString());
      }
      return stringList;
    }
    return null;
  }
}