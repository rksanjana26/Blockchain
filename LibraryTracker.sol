// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LibraryTracker {
    address public librarian;

    struct Book {
        string title;
        string author;
        bool isAvailable;
    }

    mapping(string => Book) private books;

    event BookAdded(string indexed bookId, string title, string author);
    event BookBorrowed(string indexed bookId, address borrower);

    constructor() {
        librarian = msg.sender;
    }

    function addBook(
        string memory _bookId,
        string memory _title,
        string memory _author
    ) public {
        require(msg.sender == librarian, "Only librarian can add books");
        require(bytes(_bookId).length > 0, "Book ID required");
        require(bytes(books[_bookId].title).length == 0, "Book ID already exists");

        books[_bookId] = Book({
            title: _title,
            author: _author,
            isAvailable: true
        });

        emit BookAdded(_bookId, _title, _author);
    }

    function borrowBook(string memory _bookId) public {
        require(books[_bookId].isAvailable, "Book not available");
        books[_bookId].isAvailable = false;

        emit BookBorrowed(_bookId, msg.sender);
    }

    function checkBook(string memory _bookId)
        public
        view
        returns (
            string memory title,
            string memory author,
            bool isAvailable
        )
    {
        Book memory b = books[_bookId];
        return (b.title, b.author, b.isAvailable);
    }
}