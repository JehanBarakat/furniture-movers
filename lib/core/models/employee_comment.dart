class EmployeeComment {
  final int? id;
  final int? employeeId;
  final String? question;
  final String? answer;
  final double? rating;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  EmployeeComment({
    this.id,
    this.employeeId,
    this.question,
    this.answer,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  factory EmployeeComment.fromJson(Map<String, dynamic> json) {
    return EmployeeComment(
      id: json['id'],
      employeeId: json['employee_id'],
      question: json['question'],
      answer: json['answer'],
      rating: json['rating']?.toDouble(),
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : null,
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employee_id': employeeId,
      'question': question,
      'answer': answer,
      'rating': rating,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
} 