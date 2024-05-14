class CaloriesImage {
  List<String> food = [
    'assets/images/10.jpeg',
    'assets/images/11.jpg',
    'assets/images/12.jpg',
    'assets/images/13.jpg',
  ];
  List<String> beverges = [
    '',
    '',
    '',
    '',
    '',
  ];
  List<String> flour = [
    '',
    '',
    '',
    '',
    '',
  ];
  List<String> fastfood = [
    '',
    '',
    '',
    '',
    '',
  ];
  List<String> vegetable = [
    '',
    '',
    '',
    '',
    '',
  ];
  List<String> fruit = [
    '',
    '',
    '',
    '',
    '',
  ];
  List<String> sweet = [
    '',
    '',
    '',
    '',
    '',
  ];
  List<String> meat = [
    '',
    '',
    '',
    '',
    '',
  ];
  String getFoodImageByIndex(int index) {
    if (index >= 0 && index < food.length) {
      return food[index];
    } else {
      return 'images/1.jpg';
    }
  }

  String getFoodImageByIndexV(int index) {
    if (index >= 0 && index < vegetable.length) {
      return vegetable[index];
    } else {
      return 'images/1.jpg';
    }
  }

  String getFoodImageByIndex1(int index) {
    if (index >= 0 && index < beverges.length) {
      return beverges[index];
    } else {
      return 'images/1.jpg';
    }
  }

  String getFoodImageByIndex2(int index) {
    if (index >= 0 && index < flour.length) {
      return flour[index];
    } else {
      return 'images/1.jpg';
    }
  }

  String getFoodImageByIndex3fF(int index) {
    if (index >= 0 && index < fastfood.length) {
      return fastfood[index];
    } else {
      return 'images/1.jpg';
    }
  }

  String getFoodImageByIndexsweet(int index) {
    if (index >= 0 && index < sweet.length) {
      return sweet[index];
    } else {
      return 'images/1.jpg';
    }
  }

  String getFoodImageByIndexMeat(int index) {
    if (index >= 0 && index < meat.length) {
      return meat[index];
    } else {
      return 'images/1.jpg';
    }
  }

  String getFoodImageByIndexfruits(int index) {
    if (index >= 0 && index < fruit.length) {
      return fruit[index];
    } else {
      return 'images/1.jpg';
    }
  }
}
