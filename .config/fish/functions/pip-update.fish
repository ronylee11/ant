function pip-update --wraps=ls --wraps=pip3\ list\ -o\ \|\ cut\ -f1\ -d\'\ \'\ \|\ tr\ \"\ \"\ \"\\n\"\ \|\ awk\ \'\{if\(NR\>=3\)print\}\'\ \|\ cut\ -d\'\ \'\ -f1\ \|\ xargs\ -n1\ pip3\ install\ -U --description alias\ pip-update=pip3\ list\ -o\ \|\ cut\ -f1\ -d\'\ \'\ \|\ tr\ \"\ \"\ \"\\n\"\ \|\ awk\ \'\{if\(NR\>=3\)print\}\'\ \|\ cut\ -d\'\ \'\ -f1\ \|\ xargs\ -n1\ pip3\ install\ -U
  pip3 list -o | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print}' | cut -d' ' -f1 | xargs -n1 pip3 install -U $argv; 
end
