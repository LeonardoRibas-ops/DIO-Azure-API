import azure.functions as func
import json
from payment_service import process_payment

def main(req: func.HttpRequest) -> func.HttpResponse:
    try:
        body = req.get_json()
        result = process_payment(body)
        return func.HttpResponse(json.dumps(result), status_code=200)
    except Exception as e:
        return func.HttpResponse(
            json.dumps({'error': str(e)}),
            status_code=400
        )

