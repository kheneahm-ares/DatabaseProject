json.extract! book, :id, :isbn, :title, :pages, :publisher, :copiesLeft, :created_at, :updated_at
json.url book_url(book, format: :json)
