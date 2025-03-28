
use builtin;
use str;

set edit:completion:arg-completer[feroxbuster] = {|@words|
    fn spaces {|n|
        builtin:repeat $n ' ' | str:join ''
    }
    fn cand {|text desc|
        edit:complex-candidate $text &display=$text' '(spaces (- 14 (wcswidth $text)))$desc
    }
    var command = 'feroxbuster'
    for word $words[1..-1] {
        if (str:has-prefix $word '-') {
            break
        }
        set command = $command';'$word
    }
    var completions = [
        &'feroxbuster'= {
            cand -u 'The target URL (required, unless [--stdin || --resume-from] used)'
            cand --url 'The target URL (required, unless [--stdin || --resume-from] used)'
            cand --resume-from 'State file from which to resume a partially complete scan (ex. --resume-from ferox-1606586780.state)'
            cand -p 'Proxy to use for requests (ex: http(s)://host:port, socks5(h)://host:port)'
            cand --proxy 'Proxy to use for requests (ex: http(s)://host:port, socks5(h)://host:port)'
            cand -P 'Send only unfiltered requests through a Replay Proxy, instead of all requests'
            cand --replay-proxy 'Send only unfiltered requests through a Replay Proxy, instead of all requests'
            cand -R 'Status Codes to send through a Replay Proxy when found (default: --status-codes value)'
            cand --replay-codes 'Status Codes to send through a Replay Proxy when found (default: --status-codes value)'
            cand -a 'Sets the User-Agent (default: feroxbuster/2.6.0)'
            cand --user-agent 'Sets the User-Agent (default: feroxbuster/2.6.0)'
            cand -x 'File extension(s) to search for (ex: -x php -x pdf js)'
            cand --extensions 'File extension(s) to search for (ex: -x php -x pdf js)'
            cand -m 'Which HTTP request method(s) should be sent (default: GET)'
            cand --methods 'Which HTTP request method(s) should be sent (default: GET)'
            cand --data 'Request''s Body; can read data from a file if input starts with an @ (ex: @post.bin)'
            cand -H 'Specify HTTP headers to be used in each request (ex: -H Header:val -H ''stuff: things'')'
            cand --headers 'Specify HTTP headers to be used in each request (ex: -H Header:val -H ''stuff: things'')'
            cand -b 'Specify HTTP cookies to be used in each request (ex: -b stuff=things)'
            cand --cookies 'Specify HTTP cookies to be used in each request (ex: -b stuff=things)'
            cand -Q 'Request''s URL query parameters (ex: -Q token=stuff -Q secret=key)'
            cand --query 'Request''s URL query parameters (ex: -Q token=stuff -Q secret=key)'
            cand --dont-scan 'URL(s) or Regex Pattern(s) to exclude from recursion/scans'
            cand -S 'Filter out messages of a particular size (ex: -S 5120 -S 4927,1970)'
            cand --filter-size 'Filter out messages of a particular size (ex: -S 5120 -S 4927,1970)'
            cand -X 'Filter out messages via regular expression matching on the response''s body (ex: -X ''^ignore me$'')'
            cand --filter-regex 'Filter out messages via regular expression matching on the response''s body (ex: -X ''^ignore me$'')'
            cand -W 'Filter out messages of a particular word count (ex: -W 312 -W 91,82)'
            cand --filter-words 'Filter out messages of a particular word count (ex: -W 312 -W 91,82)'
            cand -N 'Filter out messages of a particular line count (ex: -N 20 -N 31,30)'
            cand --filter-lines 'Filter out messages of a particular line count (ex: -N 20 -N 31,30)'
            cand -C 'Filter out status codes (deny list) (ex: -C 200 -C 401)'
            cand --filter-status 'Filter out status codes (deny list) (ex: -C 200 -C 401)'
            cand --filter-similar-to 'Filter out pages that are similar to the given page (ex. --filter-similar-to http://site.xyz/soft404)'
            cand -s 'Status Codes to include (allow list) (default: 200 204 301 302 307 308 401 403 405)'
            cand --status-codes 'Status Codes to include (allow list) (default: 200 204 301 302 307 308 401 403 405)'
            cand -T 'Number of seconds before a client''s request times out (default: 7)'
            cand --timeout 'Number of seconds before a client''s request times out (default: 7)'
            cand -t 'Number of concurrent threads (default: 50)'
            cand --threads 'Number of concurrent threads (default: 50)'
            cand -d 'Maximum recursion depth, a depth of 0 is infinite recursion (default: 4)'
            cand --depth 'Maximum recursion depth, a depth of 0 is infinite recursion (default: 4)'
            cand -L 'Limit total number of concurrent scans (default: 0, i.e. no limit)'
            cand --scan-limit 'Limit total number of concurrent scans (default: 0, i.e. no limit)'
            cand --parallel 'Run parallel feroxbuster instances (one child process per url passed via stdin)'
            cand --rate-limit 'Limit number of requests per second (per directory) (default: 0, i.e. no limit)'
            cand --time-limit 'Limit total run time of all scans (ex: --time-limit 10m)'
            cand -w 'Path to the wordlist'
            cand --wordlist 'Path to the wordlist'
            cand -I 'File extension(s) to Ignore while collecting extensions (only used with --collect-extensions)'
            cand --dont-collect 'File extension(s) to Ignore while collecting extensions (only used with --collect-extensions)'
            cand -o 'Output file to write results to (use w/ --json for JSON entries)'
            cand --output 'Output file to write results to (use w/ --json for JSON entries)'
            cand --debug-log 'Output file to write log entries (use w/ --json for JSON entries)'
            cand -h 'Print help information'
            cand --help 'Print help information'
            cand -V 'Print version information'
            cand --version 'Print version information'
            cand --stdin 'Read url(s) from STDIN'
            cand --burp 'Set --proxy to http://127.0.0.1:8080 and set --insecure to true'
            cand --burp-replay 'Set --replay-proxy to http://127.0.0.1:8080 and set --insecure to true'
            cand --smart 'Set --extract-links, --auto-tune, --collect-words, and --collect-backups to true'
            cand --thorough 'Use the same settings as --smart and set --collect-extensions to true'
            cand -A 'Use a random User-Agent'
            cand --random-agent 'Use a random User-Agent'
            cand -f 'Append / to each request''s URL'
            cand --add-slash 'Append / to each request''s URL'
            cand -r 'Allow client to follow redirects'
            cand --redirects 'Allow client to follow redirects'
            cand -k 'Disables TLS certificate validation in the client'
            cand --insecure 'Disables TLS certificate validation in the client'
            cand -n 'Do not scan recursively'
            cand --no-recursion 'Do not scan recursively'
            cand -e 'Extract links from response body (html, javascript, etc...); make new requests based on findings'
            cand --extract-links 'Extract links from response body (html, javascript, etc...); make new requests based on findings'
            cand --auto-tune 'Automatically lower scan rate when an excessive amount of errors are encountered'
            cand --auto-bail 'Automatically stop scanning when an excessive amount of errors are encountered'
            cand -D 'Don''t auto-filter wildcard responses'
            cand --dont-filter 'Don''t auto-filter wildcard responses'
            cand -E 'Automatically discover extensions and add them to --extensions (unless they''re in --dont-collect)'
            cand --collect-extensions 'Automatically discover extensions and add them to --extensions (unless they''re in --dont-collect)'
            cand -B 'Automatically request likely backup extensions for "found" urls'
            cand --collect-backups 'Automatically request likely backup extensions for "found" urls'
            cand -g 'Automatically discover important words from within responses and add them to the wordlist'
            cand --collect-words 'Automatically discover important words from within responses and add them to the wordlist'
            cand -v 'Increase verbosity level (use -vv or more for greater effect. [CAUTION] 4 -v''s is probably too much)'
            cand --verbosity 'Increase verbosity level (use -vv or more for greater effect. [CAUTION] 4 -v''s is probably too much)'
            cand --silent 'Only print URLs + turn off logging (good for piping a list of urls to other commands)'
            cand -q 'Hide progress bars and banner (good for tmux windows w/ notifications)'
            cand --quiet 'Hide progress bars and banner (good for tmux windows w/ notifications)'
            cand --json 'Emit JSON logs to --output and --debug-log instead of normal text'
            cand --no-state 'Disable state output file (*.state)'
        }
    ]
    $completions[$command]
}
