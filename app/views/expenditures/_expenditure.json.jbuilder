json.extract! expenditure, :id, :author_id, :name, :amount, :created_at, :updated_at
json.url expenditure_url(expenditure, format: :json)
