enum Category {alimentacion, transporte, vivienda, entretenimiento, personal}

class Transaction{
  String concept;
  double amount;
  Category category;

  Transaction(this.concept, this.amount, this.category);
}