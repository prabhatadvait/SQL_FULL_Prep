SELECT LOWER(word) AS word,
       COUNT(*) AS occurrences
FROM google_file_store t,
     regexp_split_to_table(regexp_replace(t.contents, '[[:punct:]]', '', 'g'), E'\\s+') AS word
GROUP BY LOWER(word)
ORDER BY occurrences DESC;