select users.id as "user_id", login, address_books.id as "book_id", title from user_address_books join users on (users.id = user_address_books.user_id) join address_books on (address_books.id = user_address_books.id);

