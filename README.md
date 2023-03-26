Create a REST API using ASP.NET MVC and write a method to return a sorted list of these by Publisher, Author (last, first), then title.
-Done
Get - /api/books 

If you had to create one or more tables to store the Book data in a MS SQL database, outline the table design along with fields and their datatypes.
- CascadeAssessmentDB.Sql (includes table/stored proc)
- the table designe can be improved, but i just went with minimal approach to demonstrate the functionality with the limited time.

Write another API method to add an entry to the Book table.
-Done 
Post - /api/books

Write stored procedures in MS SQL Server for steps 1 and 3, and use them in separate API methods to return the same results.
-Done
Get - /api/GetBooksBySP
Post - /api/PostBooksBySP

Write an API method to return the total price of all books in the database.
-Done
Get - /api/books/GetTotalBooksPrice

If you have a large list of these in memory and want to save the entire list to the MS SQL Server database, what is the most efficient way to save the list with only one call to the DB server?
we can use AddRange method in entity framework.

Add a property to the Book class that outputs the MLA (Modern Language Association) style citation as a string (https://images.app.goo.gl/YkFgbSGiPmie9GgWA). Please add whatever additional properties the Book class needs to generate the citation.
- Done
Added get property to format string

Add another property to generate a Chicago style citation (Chicago Manual of Style) (https://images.app.goo.gl/w3SRpg2ZFsXewdAj7).
- Done
Added get property to format string
