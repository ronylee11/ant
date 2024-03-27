function lsc --wraps='ls && sleep 0.5 && c' --description 'alias lsc=ls && sleep 0.5 && c'
  ls && sleep 0.5 && c $argv; 
end
