enum Category {alimentacion, transporte, vivienda, entretenimiento, personal}

class Transaction{
  String concept;
  double amount;
  String type;
  Category category;

  Transaction(this.type, this.concept, this.category, this.amount);
}