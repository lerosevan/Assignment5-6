using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web.Services;

[WebService(Namespace = "http://example.com/wordfilter")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class WordFilterService : WebService
{
    // List of stop words
    private static readonly HashSet<string> StopWords = new HashSet<string>
    {
        "a", "an", "in", "on", "the", "is", "are", "am"
    };

    [WebMethod]
    public string WordFilter(string inputString)
    {
        if (string.IsNullOrWhiteSpace(inputString))
        {
            return string.Empty;
        }

        // Remove XML tags using a regex
        string textWithoutTags = Regex.Replace(inputString, "<[^>]*>", string.Empty);

        // Split into words and filter out stop words
        string[] words = textWithoutTags.Split(new[] { ' ', '\t', '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries);
        List<string> filteredWords = new List<string>();

        foreach (var word in words)
        {
            if (!StopWords.Contains(word.ToLower()))
            {
                filteredWords.Add(word);
            }
        }

        // Return the filtered string
        return string.Join(" ", filteredWords);
    }
}