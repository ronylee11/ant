function speedtest --wraps=speedtest-cli --description 'alias speedtest speedtest --secure'
 command speedtest --secure --bytes $argv; 
end
