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
  bool? themeOptionsBook;
  bool? keywordOptions;
  bool? toneOptionsBook;
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
  bool? cusineRegion;
  bool? nameLength;
  bool? gamingNameThemesOptions;
  bool? gameOptions;
  bool? religion;
  bool? country;
  bool? personality;
  bool? dob;
  bool? name;
  bool? petType;
  bool? themeDog;
  bool? productTypeOptions;
  bool? targetAudienceOptionss;
  bool? productFeatures;
  bool? styleOrToneProdu;
  bool? pr;
  bool? domainOptions;
  bool? geographicFocus;
  bool? themeStory;
  bool? element;
  bool? mood;
  bool? numMembers;
  bool? themeTeam;
  bool? title;
  bool? typeOfWork;
  bool? subject;
  bool? keywordIdeas;
  bool? toneStyleTitle;
  bool? twinsGender;
  bool? namingStyle;
  bool? background;

  BooleanForm({
    this.topicOptions = false,
    this.targetAudienceOptions = false,
    this.keywordPhrasesOptions = false,
    this.themeOptionsBook = false,
    this.keywordOptions = false,
    this.toneOptionsBook = false,
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
    this.cusineRegion = false,
    this.nameLength = false,
    this.gamingNameThemesOptions = false,
    this.gameOptions = false,
    this.religion = false,
    this.country = false,
    this.personality = false,
    this.dob = false,
    this.name = false,
    this.petType = false,
    this.themeDog = false,
    this.productTypeOptions = false,
    this.targetAudienceOptionss = false,
    this.productFeatures = false,
    this.styleOrToneProdu = false,
    this.pr = false,
    this.domainOptions = false,
    this.geographicFocus = false,
    this.themeStory = false,
    this.element = false,
    this.mood = false,
    this.numMembers = false,
    this.themeTeam = false,
    this.title = false,
    this.typeOfWork = false,
    this.subject = false,
    this.keywordIdeas = false,
    this.toneStyleTitle = false,
    this.twinsGender = false,
    this.namingStyle = false,
    this.background = false,
  });

  BooleanForm.fromJson(json)
      : topicOptions = json['topic_options'] ?? false,
        targetAudienceOptions = json['target_audience_options'] ?? false,
        keywordPhrasesOptions = json['keyword_phrases_options'] ?? false,
        themeOptionsBook = json['theme_options_book'] ?? false,
        keywordOptions = json['keyword_options'] ?? false,
        toneOptionsBook = json['tone_options_book'] ?? false,
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
        cusineRegion = json['cusineRegion'] ?? false,
        nameLength = json['nameLength'] ?? false,
        gamingNameThemesOptions = json['gamingNameThemesOptions'] ?? false,
        gameOptions = json['gameOptions'] ?? false,
        religion = json['religion'] ?? false,
        country = json['country'] ?? false,
        personality = json['personality'] ?? false,
        dob = json['dob'] ?? false,
        name = json['name'] ?? false,
        petType = json['pet_type'] ?? false,
        themeDog = json['theme_dog'] ?? false,
        productTypeOptions = json['product_type_options'] ?? false,
        targetAudienceOptionss = json['target_audience_optionss'] ?? false,
        productFeatures = json['product_features'] ?? false,
        styleOrToneProdu = json['style_or_tone_produ'] ?? false,
        pr = json['pr'] ?? false,
        domainOptions = json['domain_options'] ?? false,
        geographicFocus = json['geographic_focus'] ?? false,
        themeStory = json['theme_story'] ?? false,
        element = json['element'] ?? false,
        mood = json['mood'] ?? false,
        numMembers = json['num_members'] ?? false,
        themeTeam = json['theme_team'] ?? false,
        title = json['title'] ?? false,
        typeOfWork = json['typeOfWork'] ?? false,
        subject = json['subject'] ?? false,
        keywordIdeas = json['keyword_ideas'] ?? false,
        toneStyleTitle = json['tone_style_title'] ?? false,
        twinsGender = json['twinsGender'] ?? false,
        namingStyle = json['naming_style'] ?? false,
        background = json['background'] ?? false;

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
}
