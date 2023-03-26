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
        public string? TitleContainer { get; set; }
        public DateTime? PublicationDate { get; set; }
        public string? PageNumberRange { get; set; }
        public string? Url { get; set; }
        public int? Volume { get; set; }

        public string ModernLanguageAssociationStyle
        {
            get
            {
                return $@"{AuthorLastName}, {AuthorFirstName}. ""{Title}"" {TitleContainer}, {Publisher}, {PublicationDate?.ToString("yyyy")}, pp. {PageNumberRange}.";
            }

        }

        public string ChicagoManualOfStyle
        {
            get
            {
                return $@"{AuthorLastName}, {AuthorFirstName}. {PublicationDate?.ToString("yyyy")} ""{Title}"" {TitleContainer}, no. {Volume}. ({PublicationDate?.ToString("MMM yyyy") }): {PageNumberRange} {Url}";
            }

        }
    }
}
