function check_command
  #set current argv to a variable, fileName
  set fileName $argv

  #print 'This is a dangerous command. Are you sure you want to continue? (y/n)'
  read -l -P 'This is a dangerous command. Are you sure you want to continue? (y/n) ' -n 1 -s confirm
  echo

  #if confirm is y, continue
  if test $confirm = 'y'
    #if has multiple arguments, print error message and return
    if test (count $argv) -gt 1
      echo 'Error: Too many arguments'
      return
    end

    #if argv has / at the end, set argv (string replace -r / '' $argv)
    if test (string match -r '.*\/$' $fileName)
      set fileName (string replace -r '\/$' '' $fileName)
    end

    rm -rf (find . -mindepth 1 -maxdepth 1 -not -name $fileName -not -path "./$fileName/*" -print)
    echo "Removed all files except '$fileName'"
  else if test $confirm = 'n'
    echo 'Aborted'
    return
  else
    check_command
  end
end

function rmx --description "Remove all files in the current directory except the one that contains the given string"
  contains -- $argv

  #if no arguments provided, print error message and return
  if test (count $argv) -eq 0
    echo "No arguments provided. Use -h or --help for usage."
    return 1
  end

  #show help message if argument is -h or --help
  for arg in $argv
    switch $arg
      case '-h' '--help'
        echo "Usage: rmx <string>"
        echo "Remove all files in the current directory except the one that contains the given string"
        return 0
      case '*'
        break
    end
  end

  check_command $argv
end
