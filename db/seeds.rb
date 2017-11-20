# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Historical Fiction")
Category.create(name: "Fiction")
Category.create(name: "Non-fiction")
Category.create(name: "Thriller")
Category.create(name: "Epic Fantasy")

Author.create(fName: "George", lName: "Saunders")
Author.create(fName: "Mohsin", lName: "Hamid")
Author.create(fName: "David", lName: "Grann")
Author.create(fName: "Arundhati", lName: "Roy")
Author.create(fName: "Elizabeth", lName: "Strout")
Author.create(fName: "Jesmyn", lName: "Ward")
Author.create(fName: "Jennifer", lName: "Egan")
Author.create(fName: "Brandon", lName: "Sanderson")

Book.create(isbn: 9789044539219, title: "Lincoln in the Bardo", pages: 368, publisher: "Random House", copiesLeft: 10, categoryId: 1, authorId: 1)
Book.create(isbn: 9780525535065, title: "Exit West", pages: 240, publisher: "Riverhead Books", copiesLeft: 8, categoryId: 2, authorId: 2)
Book.create(isbn: 9780857209023, title: "Killers of the Flower Moon", pages: 352, publisher: "Doubleday", copiesLeft: 5, categoryId: 3, authorId: 3)
Book.create(isbn: 9781524733155, title: "The Ministry of Utmost Happiness", pages: 449, publisher: "Knopf", copiesLeft: 6, categoryId: 2, authorId: 4)
Book.create(isbn: 9781524774929, title: "Anything Is Possible", pages: 272, publisher: "Random House", copiesLeft: 9, categoryId: 2, authorId: 5)
Book.create(isbn: 9781501126093, title: "Sing, Unburied, Sing", pages: 304, publisher: "Scribner", copiesLeft: 10, categoryId: 4, authorId: 6)
Book.create(isbn: 9781432843410, title: "Manhattan Beach", pages: 438, publisher: "Scribner", copiesLeft: 3, categoryId: 1, authorId: 7)
Book.create(isbn: 9780765326379, title: "Oathbringer", pages: 1248, publisher: "Tor Books", copiesLeft: 7, categoryId: 5, authorId: 8)
