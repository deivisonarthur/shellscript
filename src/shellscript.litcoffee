High level, synchronous interface to let you build just plain shell scripts.

    sheller = require '../build/Release/sheller'
    module.exports =


Register all our functions as globals, this makes it a lot like other languages
you may know and love.

        globalize: ->
            global.shell = module.exports.shell
            global.$ = module.exports.$
            global.run = module.exports.run

The classic, run any shell command line, using your current shell. This is
essentially `$SHELL -c <command>`. Streams stdout and stdin are connected
with your parent process, running out the command line. This blocks until
the shelled command is done, then returns the exit code.

        shell: (command) ->
            sheller.shell command

$, the subshell command, returns stdout as a string. This is useful for string
interpolation.

        $: (command, args...) ->
            ret = sheller.shell command, true, args
            if ret.exitCode
                ''
            else
                ret.stdout


