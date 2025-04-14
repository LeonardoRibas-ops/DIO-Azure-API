def process_payment(data):
    if 'amount' not in data:
        raise ValueError("Parâmetro 'amount' é obrigatório")
    # Lógica fictícia
    return {
        "status": "sucesso",
        "valor_processado": data["amount"]
    }

