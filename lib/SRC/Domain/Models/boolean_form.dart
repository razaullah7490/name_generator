// class BooleanForm {
//   /// blog
//   ///
//   bool? topic_options;
//   bool? target_audience_options;
//   bool? keyword_phrases_options;

//   ///
//   ///book
//   ///
//   bool? theme_options;
//   bool? keyword_options;
//   bool? tone_options;

//   ///
//   ///character
//   ///
//   bool? gender;
//   bool? region;
//   bool? name_style;
//   bool? flavour;
//   bool? charType;
//   bool? letter;

//   ///
//   ///Dish
//   ///

//   bool? type;
//   bool? cookingStyle;
//   bool? texture;
//   bool? taste;
//   bool? ingredient;
//   bool? cusineRegion;

//   ///
//   ///Gamers
//   ///

//   bool? genderr; //
//   bool? nameLength;
//   bool? gamingNameThemesOptions;
//   bool? gameOptions;
//   bool? letterr; //

//   ///
//   /// Human
//   ///
//   bool? genderrr; //
//   bool? religion;
//   bool? country;
//   bool? letterrrr; //
//   bool? personality;
//   bool? dob;

// ////nick

//   ///
//   bool? countryy; //
//   bool? name;

//   ///pet
//   ///

//   bool? genderrrr; //
//   bool? pet_type;
//   bool? letterrr; //
//   bool? name_lengh;
//   bool? theme;

//   /// product
//   ///

//   bool? product_type_options;
//   bool? target_audience_optionss; //
//   bool? product_features;
//   bool? style_or_tone;
//   bool? selected_keywords;

//   /// slogan
//   ///

//   bool? domain_options;
//   bool? geographic_focus;

//   ///story
//   ///
//   bool? themee; //
//   bool? element;
//   bool? mood;

//   ///
//   ///Team
//   ///

//   bool? num_members;
//   bool? genderrrrr; //
//   bool? themeee; //

//   ///Title
//   ///
//   bool? title;
//   bool? typeOfWork;
//   bool? subject;
//   bool? keyword_ideas;
//   bool? tone_style;

//   ///Twins
//   ///

//   bool? twinsGender;
//   bool? naming_style;
//   bool? background;
//   bool? religionn; 
//   bool? countryyy;
//   bool? letterrrrr;
// }
class BooleanForm {
  bool? topicOptions;
  bool? targetAudienceOptions;
  bool? keywordPhrasesOptions;
  bool? themeOptions;
  bool? keywordOptions;
  bool? toneOptions;
  bool? gender;
  bool? region;
  bool? nameStyle;
  bool? flavour;
  bool? charType;
  bool? letter;
  bool? type;
  bool? cookingStyle;
  bool? texture;
  bool? taste;
  bool? ingredient;
  bool? cuisineRegion;
  bool? genderR;
  bool? nameLength;
  bool? gamingNameThemesOptions;
  bool? gameOptions;
  bool? letterR;
  bool? genderRR;
  bool? religion;
  bool? country;
  bool? letterRR;
  bool? personality;
  bool? dob;
  bool? countryY;
  bool? nameY;
  bool? genderRRR;
  bool? petType;
  bool? letterRRR;
  bool? nameLengthY;
  bool? themeY;
  bool? productTypeOptions;
  bool? targetAudienceOptionss;
  bool? productFeatures;
  bool? styleOrTone;
  bool? selectedKeywords;
  bool? domainOptions;
  bool? geographicFocus;
  bool? themeE;
  bool? element;
  bool? mood;
  bool? numMembers;
  bool? genderRRRR;
  bool? themeEE;
  bool? title;
  bool? typeOfWork;
  bool? subject;
  bool? keywordIdeas;
  bool? toneStyle;
  bool? twinsGender;
  bool? namingStyle;
  bool? background;
  bool? religionN;
  bool? countryYy;
  bool? letterRRRR;

  BooleanForm({
    this.topicOptions = false,
    this.targetAudienceOptions = false,
    this.keywordPhrasesOptions = false,
    this.themeOptions = false,
    this.keywordOptions = false,
    this.toneOptions = false,
    this.gender = false,
    this.region = false,
    this.nameStyle = false,
    this.flavour = false,
    this.charType = false,
    this.letter = false,
    this.type = false,
    this.cookingStyle = false,
    this.texture = false,
    this.taste = false,
    this.ingredient = false,
    this.cuisineRegion = false,
    this.genderR = false,
    this.nameLength = false,
    this.gamingNameThemesOptions = false,
    this.gameOptions = false,
    this.letterR = false,
    this.genderRR = false,
    this.religion = false,
    this.country = false,
    this.letterRR = false,
    this.personality = false,
    this.dob = false,
    this.countryY = false,
    this.nameY = false,
    this.genderRRR = false,
    this.petType = false,
    this.letterRRR = false,
    this.nameLengthY = false,
    this.themeY = false,
    this.productTypeOptions = false,
    this.targetAudienceOptionss = false,
    this.productFeatures = false,
    this.styleOrTone = false,
    this.selectedKeywords = false,
    this.domainOptions = false,
    this.geographicFocus = false,
    this.themeE = false,
    this.element = false,
    this.mood = false,
    this.numMembers = false,
    this.genderRRRR = false,
    this.themeEE = false,
    this.title = false,
    this.typeOfWork = false,
    this.subject = false,
    this.keywordIdeas = false,
    this.toneStyle = false,
    this.twinsGender = false,
    this.namingStyle = false,
    this.background = false,
    this.religionN = false,
    this.countryYy = false,
    this.letterRRRR = false,
  });

  BooleanForm.fromJson(Map<String, dynamic> json)
      : topicOptions = json['topic_options'] ?? false,
        targetAudienceOptions = json['target_audience_options'] ?? false,
        keywordPhrasesOptions = json['keyword_phrases_options'] ?? false,
        themeOptions = json['theme_options'] ?? false,
        keywordOptions = json['keyword_options'] ?? false,
        toneOptions = json['tone_options'] ?? false,
        gender = json['gender'] ?? false,
        region = json['region'] ?? false,
        nameStyle = json['name_style'] ?? false,
        flavour = json['flavour'] ?? false,
        charType = json['charType'] ?? false,
        letter = json['letter'] ?? false,
        type = json['type'] ?? false,
        cookingStyle = json['cookingStyle'] ?? false,
        texture = json['texture'] ?? false,
        taste = json['taste'] ?? false,
        ingredient = json['ingredient'] ?? false,
        cuisineRegion = json['cusineRegion'] ?? false,
        genderR = json['genderr'] ?? false,
        nameLength = json['nameLength'] ?? false,
        gamingNameThemesOptions = json['gamingNameThemesOptions'] ?? false,
        gameOptions = json['gameOptions'] ?? false,
        letterR = json['letterr'] ?? false,
        genderRR = json['genderrr'] ?? false,
        religion = json['religion'] ?? false,
        country = json['country'] ?? false,
        letterRR = json['letterrrr'] ?? false,
        personality = json['personality'] ?? false,
        dob = json['dob'] ?? false,
        countryY = json['countryy'] ?? false,
        nameY = json['name'] ?? false,
        genderRRR = json['genderrrr'] ?? false,
        petType = json['pet_type'] ?? false,
        letterRRR = json['letterrr'] ?? false,
        nameLengthY = json['name_lengh'] ?? false,
        themeY = json['theme'] ?? false,
        productTypeOptions = json['product_type_options'] ?? false,
        targetAudienceOptionss = json['target_audience_optionss'] ?? false,
        productFeatures = json['product_features'] ?? false,
        styleOrTone = json['style_or_tone'] ?? false,
        selectedKeywords = json['selected_keywords'] ?? false,
        domainOptions = json['domain_options'] ?? false,
        geographicFocus = json['geographic_focus'] ?? false,
        themeE = json['themee'] ?? false,
        element = json['element'] ?? false,
        mood = json['mood'] ?? false,
        numMembers = json['num_members'] ?? false,
        genderRRRR = json['genderrrrr'] ?? false,
        themeEE = json['themeee'] ?? false,
        title = json['title'] ?? false,
        typeOfWork = json['typeOfWork'] ?? false,
        subject = json['subject'] ?? false,
        keywordIdeas = json['keyword_ideas'] ?? false,
        toneStyle = json['tone_style'] ?? false,
        twinsGender = json['twinsGender'] ?? false,
        namingStyle = json['naming_style'] ?? false,
        background = json['background'] ?? false,
        religionN = json['religionn'] ?? false,
        countryYy = json['countryyy'] ?? false,
        letterRRRR = json['letterrrrr'] ?? false;

  Map<String, dynamic> toJson() {
    return {
      'topic_options': topicOptions,
      'target_audience_options': targetAudienceOptions,
      'keyword_phrases_options': keywordPhrasesOptions,
      'theme_options': themeOptions,
      'keyword_options': keywordOptions,
      'tone_options': toneOptions,
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
      'cusineRegion': cuisineRegion,
      'genderr': genderR,
      'nameLength': nameLength,
      'gamingNameThemesOptions': gamingNameThemesOptions,
      'gameOptions': gameOptions,
      'letterr': letterR,
      'genderrr': genderRR,
      'religion': religion,
      'country': country,
      'letterrrr': letterRR,
      'personality': personality,
      'dob': dob,
      'countryy': countryY,
      'name': nameY,
      'genderrrr': genderRRR,
      'pet_type': petType,
      'letterrr': letterRR,
      'name_lengh': nameLengthY,
      'theme': themeY,
      'product_type_options': productTypeOptions,
      'target_audience_optionss': targetAudienceOptionss,
      'product_features': productFeatures,
      'style_or_tone': styleOrTone,
      'selected_keywords': selectedKeywords,
      'domain_options': domainOptions,
      'geographic_focus': geographicFocus,
      'themee': themeE,
      'element': element,
      'mood': mood,
      'num_members': numMembers,
      'genderrrrr': genderRRRR,
      'themeee': themeEE,
      'title': title,
      'typeOfWork': typeOfWork,
      'subject': subject,
      'keyword_ideas': keywordIdeas,
      'tone_style': toneStyle,
      'twinsGender': twinsGender,
      'naming_style': namingStyle,
      'background': background,
      'religionn': religionN,
      'countryyy': countryYy,
      'letterrrrr': letterRRRR,
    };
  }
}
