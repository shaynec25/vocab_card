enum WordClass {
  noun,
  adj,
  adv,
  verb,
}

WordClass toWordClass(String str) {
  switch (str) {
    case 'noun':
      return WordClass.noun;
    case 'adj':
      return WordClass.adj;
    case 'adv':
      return WordClass.adv;
    case 'verb':
      return WordClass.verb;
    default:
      return WordClass.noun;
  }
}

String wordClassToString(WordClass wordClass) {
  switch (wordClass) {
    case WordClass.noun:
      return 'noun';
    case WordClass.adj:
      return 'adj';
    case WordClass.adv:
      return 'adv';
    case WordClass.verb:
      return 'verb';
  }
}
