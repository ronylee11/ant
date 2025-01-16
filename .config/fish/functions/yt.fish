function yt --wraps=youtube-dl\ -o\ \'/home/cleff/Downloads/\%\(title\)s-\%\(id\)s.\%\(ext\)s\'\ -f\ bestaudio --description alias\ yt=youtube-dl\ -o\ \'/home/cleff/Downloads/\%\(title\)s-\%\(id\)s.\%\(ext\)s\'\ -f\ bestaudio
    #yt-dlp -o './%(title)s-%(id)s.%(ext)s' -f bestaudio $argv --add-metadata
    yt-dlp -o './%(title)s-%(id)s.%(ext)s' -x --audio-format mp3 $argv --add-metadata
end
