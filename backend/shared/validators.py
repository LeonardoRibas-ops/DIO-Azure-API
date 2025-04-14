def validate_payment_data(data):
    if "amount" not in data:
        raise ValueError("Campo 'amount' é obrigatório.")
    if not isinstance(data["amount"], (int, float)):
        raise ValueError("O valor de 'amount' deve ser numérico.")
    if data["amount"] <= 0:
        raise ValueError("O valor do pagamento deve ser maior que zero.")

