function btr --wraps='bluetoothctl remove' --description 'alias btr=bluetoothctl remove'
  bluetoothctl remove $argv; 
end
