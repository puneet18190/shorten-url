json.extract! record, :id, :url, :sorten_url, :count, :created_at, :updated_at
json.url record_url(record, format: :json)
