json.extract! payment, :id, :amount, :payment_method, :notes, :status, :paid_at, :created_at, :updated_at
json.url payment_url(payment, format: :json)
