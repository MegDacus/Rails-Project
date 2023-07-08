puts "Currently seeding..."

# User
# User.create(
#     username: "MegDacus",
#     first_name: "Megan",
#     last_name: "Dacus",
#     password: "password",
#     password_confirmation: "password"
# )

# Bookclub
# Bookclub.create([
#     {name: "Fantasy Bookclub", description: "A place for fans of magic and new worlds!", host_user_id: 6},
#     {name: "Romance Lovers", description: "We read books guaranteed to make us swoon and blush!", host_user_id: 8},
#     {name: "Classics Club", description: "Making classic literature fun and accessible", host_user_id: 7}
# ])

# Memberships
# Membership.create([
#     {user_id: 6, bookclub_id: 4, is_host: true},  
#     {user_id: 7, bookclub_id: 6, is_host: false},
#     {user_id: 6, bookclub_id: 5, is_host: false},
#     {user_id: 7, bookclub_id: 4, is_host: false},
#     {user_id: 8, bookclub_id: 5, is_host: true},
#     {user_id: 7, bookclub_id: 6, is_host: true}
# ])
    

# Genres
# Genre.create([
#     {name: "Fantasy"}, {name: "Romance"}, {name: "Classic"}, {name: "Mystery"},
#     {name: "Science Fiction"}, {name: "Non-Fiction"}
# ])

#Books
# Book.create([
#     {genre_id: 25, title: "ACOTAR", author: "Sarah J Maas"}, 
#     {genre_id: 26, title: "Beach Read", author: "Emily Henry"}, 
#     {genre_id: 27, title: "Anna Karenina", author: "Leo Tolstoy"}
# ])

#BookclubBooks
# BookclubBook.create([
#     {bookclub_id: 4, book_id: 5, month: "June"},
#     {bookclub_id: 5, book_id: 6, month: "May"},
#     {bookclub_id: 6, book_id: 7, month: "February"}
# ])

#DiscussionQuestions
# DiscussionQuestion.create([
#     {book_id: 5, body: "How do the masks of the High Fae affect the story?"},
#     {book_id: 5, body: "What do you think of Tamlin\’s participation in the High Rite?"},
#     {book_id: 5, body: "Discuss the theme of familial bonds in the novel. How does a person\’s family determine who he or she is?"},
#     {book_id: 6, body: "What traditional romance tropes do you see used in Beach Read? In what ways does the book deviate from or subvert romance tropes."},
#     {book_id: 6, body: "If you could visit one setting from the book, with one of its characters, whom and where would you choose? "},
#     {book_id: 6, body: "Did January’s father deserve her forgiveness? Has she truly forgiven him?"},
#     {book_id: 7, body: "Why does Anna refuse a divorce the first time it's offered, when Karenin forgives her over her supposed deathbed?"},
#     {book_id: 7, body: "How does Tolstoy use Anna Karenina as an argument for a particular kind of \'good life\'?"},
#     {book_id: 7, body: "What other ways could Tolstoy have represented an adulteress?"}
# ])


puts "Done seeding. 🌱 "