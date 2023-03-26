using System;
using System.Collections.Generic;

namespace Data
{
    public partial class Book
    {
        public int Id { get; set; }
        public string? Publisher { get; set; }
        public string? Title { get; set; }
        public string? AuthorLastName { get; set; }
        public string? AuthorFirstName { get; set; }
        public decimal? Price { get; set; }

        public string MLA
        {
            get
            {
                return $@"{AuthorLastName}, {AuthorFirstName}. ""{Title}"" {Publisher}";
            }

        }
    }
}
