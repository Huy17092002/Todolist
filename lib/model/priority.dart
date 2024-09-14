enum Priority {
  none, low, medium, high
}

extension PriorityName on Priority {

  String get name {
    switch (this) {
      case Priority.none:
        return '';
      case Priority.low:
        return '!';
      case Priority.medium:
        return '!!';
      case Priority.high:
        return '!!!';
    }
  }
}

