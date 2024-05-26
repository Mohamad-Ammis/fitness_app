class Muscle {
  final int? id;
  final String? muscleName;
  final String? muscleImageMan;
  final String? muscleImageWoman;
  final int? exerciseNumber;
  final int? totalCalories;
  final int? totalTime;
  final String? level;

  factory Muscle.fromJson(json) {
    return Muscle(
        id: json['id'],
        muscleName: json['muscle_area'],
        muscleImageMan: json['men_image'],
        muscleImageWoman: json['women_image'],
        exerciseNumber: json['exercise_count'],
        totalCalories: json['total_calories'],
        totalTime: json['total_time'],
        level: json['level']);
  }

  Muscle({
    required this.id,
    required this.muscleName,
    required this.muscleImageMan,
    required this.muscleImageWoman,
    required this.exerciseNumber,
    required this.totalCalories,
    required this.totalTime,
    required this.level,
  });
}
