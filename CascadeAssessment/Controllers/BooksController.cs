using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Data;

namespace CascadeAssessment.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BooksController : ControllerBase
    {
        private readonly CascadeAssessmentContext _context;

        public BooksController(CascadeAssessmentContext context)
        {
            _context = context;
        }

        // GET: api/Books
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Book>>> GetBooks()
        {
          if (_context.Books == null)
          {
              return NotFound();
          }
            var books = await _context.Books.OrderBy(c => c.Publisher)
                .ThenBy(n => n.AuthorLastName)
                .ThenBy(n => n.AuthorFirstName)
                .ThenBy(n => n.Title).ToListAsync();
            return books;
        }

        // GET: api/Books
        [HttpGet]
        [Route("GetBooksBySP")]
        public async Task<ActionResult<IEnumerable<Book>>> GetBooksBySP()
        {
            if (_context.Books == null)
            {
                return NotFound();
            }
            return await _context.Books.FromSqlInterpolated<Book>($"exec GetBooks").ToListAsync();
        }

        // GET: api/Books
        [HttpGet]
        [Route("GetTotalBooksPrice")]
        public async Task<ActionResult<decimal>> GetTotalBooksPrice()
        {
            if (_context.Books == null)
            {
                return NotFound();
            }
            return await _context.Books.Select(b => b.Price).SumAsync();
        }

        [HttpPost]
        [Route("PostBooksBySP")]
        public async Task<ActionResult<int>> PostBooksBySP(Book book)
        {
            if (_context.Books == null)
            {
                return Problem("Entity set 'CascadeAssessmentContext.Books'  is null.");
            }

           var rows= await _context.Database.ExecuteSqlInterpolatedAsync($"exec InsertBook @Publisher={book.Publisher},@Title={book.Title},@AuthorLastName={book.AuthorLastName},@AuthorFirstName={book.AuthorFirstName},@Price={book.Price},@TitleContainer={book.TitleContainer},@PublicationDate = { book.PublicationDate}, @PageNumberRange = { book.PageNumberRange},@Url = { book.Url}, @Volume ={ book.Volume}");
           
            return rows;
        }

       


        // GET: api/Books/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Book>> GetBook(int id)
        {
          if (_context.Books == null)
          {
              return NotFound();
          }
            var book = await _context.Books.FindAsync(id);

            if (book == null)
            {
                return NotFound();
            }

            return book;
        }

        // PUT: api/Books/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBook(int id, Book book)
        {
            if (id != book.Id)
            {
                return BadRequest();
            }

            _context.Entry(book).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Books
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Book>> PostBook(Book book)
        {
          if (_context.Books == null)
          {
              return Problem("Entity set 'CascadeAssessmentContext.Books'  is null.");
          }
            _context.Books.Add(book);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetBook", new { id = book.Id }, book);
        }

        // DELETE: api/Books/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBook(int id)
        {
            if (_context.Books == null)
            {
                return NotFound();
            }
            var book = await _context.Books.FindAsync(id);
            if (book == null)
            {
                return NotFound();
            }

            _context.Books.Remove(book);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool BookExists(int id)
        {
            return (_context.Books?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
