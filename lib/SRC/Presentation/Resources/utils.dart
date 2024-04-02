import 'package:name_generator/SRC/Presentation/Resources/strings.dart';

import 'assets.dart';

class Utils {
  List<String> profilenotification = [
    Assets.briefcase,
    Assets.man,
    Assets.dog,
  ];

  List<String> notificationtitles = [
    'Name Generated',
    'Name Shared',
    'Name Saved'
  ];
  List<String> notificationtimes = ['1h', '2h', '8h'];

  List<String> switchtitles = ['Sound', 'Vibrate'];

  List<String> businesscategoryImages = [
    Assets.shuttle,
    Assets.resturant,
    Assets.web,
    Assets.fashion,
    Assets.marketing,
    Assets.plus,
  ];

  List<String> businessradioTileTitles = [
    AppStrings.startup,
    AppStrings.resturant,
    AppStrings.webDevelopemt,
    AppStrings.fashion,
    AppStrings.other,
  ];

  final Map<String, dynamic> data = {
    'blog': {
      'domain_options': [
        "Technology",
        "Healthcare",
        "Finance",
        "Education",
        "Entertainment",
        "Food and Beverage",
        "Travel and Tourism",
        "Fashion and Apparel",
        "Automotive",
        "Real Estate",
        "Environmental",
        "Nonprofit",
        "Sports and Fitness",
        "Marketing and Advertising",
        "Legal",
        "E-commerce",
        "Social Media",
        "Gaming",
        "Music",
        "Home and Living",
        "Art and Design",
        "Beauty and Cosmetics",
        "Pet Care",
        "Parenting",
        "DIY and Crafts",
        "Fitness and Wellness",
        "Photography",
        "News and Media",
        "Event Planning",
        "Career and Job Search",
        "Dating and Relationships",
        "Astrology and Horoscopes",
        "Other"
      ],
      'geographic_focus': ["Local", "National", "International"]
    },
    'book': {
      'options': {
        'theme_options': [
          "Historical",
          "Mystery",
          "Science Fiction",
          "Adventure",
          "Fantasy",
          "Romance",
          "Self-Help",
          "Biography",
          "Comedy",
          "Horror",
          "Poetry",
          "Thriller",
          "Non-fiction",
          "Autobiography",
          "Cooking",
          "Travel",
          "Business",
          "Technology",
          "Art",
          "Sports",
          "Health",
          "Parenting",
          "Education",
          "Other"
        ],
        'keyword_options': [
          "Love",
          "Mystery",
          "Magic",
          "Time",
          "Space",
          "Detective",
          "Friendship",
          "War",
          "Quest",
          "Success",
          "Failure",
          "Hope",
          "Dream",
          "Journey",
          "Courage",
          "Destiny",
          "Future",
          "Past",
          "Reality",
          "Illusion",
          "Transformation",
          "Secret",
          "Power",
          "Freedom",
          "Adventure",
          "Other"
        ],
        'tone_options': [
          "Melancholic",
          "Uplifting",
          "Philosophical",
          "Thought-provoking",
          "Satirical",
          "Surreal",
          "Dark Comedy",
          "Bittersweet",
          "Dreamy",
          "Intellectual",
          "Inspirational",
          "Nostalgic",
          "Intense",
          "Playful",
          "Whimsical",
          "Reflective",
          "Witty",
          "Ironic",
          "Thoughtful",
          "Romantic",
          "Eccentric",
          "Hopeful",
          "Pensive",
          "Absurd",
          "Other"
        ]
      }
    }
  };
}
