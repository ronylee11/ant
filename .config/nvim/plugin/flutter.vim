" Flutter wrapper for hot-reloading
" Put this in your plugin directory (Default is $HOME/.config/nvim/plugin)
" Start your Flutter app with :FlutterRun
" all saves to flutter dart files will hot reload


command! FlutterRun :call FlutterStartServer()
command! FlutterStopRun :call FlutterStopRun()
command! FlutterHotReload :call FlutterHotReload()

function! FlutterHotReload()
	if (s:flutter_run_job != 0)
		call system('kill -USR1 $(cat /tmp/flutter.pid)')
	else
		echom 'Flutter is not running'
	endif
endfunction

function! s:OnFlutterRunEvent(job_id, data, event) dict
	if a:event == 'stdout'
		echom 'Flutter: '.join(a:data)
	elseif a:event == 'stderr'
		echom 'Flutter error: '.join(a:data)
	else
		echom 'Flutter exited'
	endif
endfunction

let s:flutter_run_job = 0
function! FlutterStartServer()
	if (s:flutter_run_job != 0)
		echom "Flutter already running"
	else
		echom "Starting Flutter"
		let s:callbacks = {
					\ 'on_stdout': function('s:OnFlutterRunEvent'),
					\ 'on_stderr': function('s:OnFlutterRunEvent'),
					\ 'on_exit': function('s:OnFlutterRunEvent')
					\ }
		let s:flutter_run_job = jobstart(['bash', '-c', 'flutter run --pid-file /tmp/flutter.pid'], s:callbacks)
	endif
endfunction

function! FlutterStopRun()
	call jobstop(s:flutter_run_job)
	let s:flutter_run_job = 0
endfunction
