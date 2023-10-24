# A function which filters options which starts with "-" from $argv.
function _swift_mythic_preprocessor
    set -l results
    for i in (seq (count $argv))
        switch (echo $argv[$i] | string sub -l 1)
            case '-'
            case '*'
                echo $argv[$i]
        end
    end
end

function _swift_mythic_using_command
    set -l currentCommands (_swift_mythic_preprocessor (commandline -opc))
    set -l expectedCommands (string split " " $argv[1])
    set -l subcommands (string split " " $argv[2])
    if [ (count $currentCommands) -ge (count $expectedCommands) ]
        for i in (seq (count $expectedCommands))
            if [ $currentCommands[$i] != $expectedCommands[$i] ]
                return 1
            end
        end
        if [ (count $currentCommands) -eq (count $expectedCommands) ]
            return 0
        end
        if [ (count $subcommands) -gt 1 ]
            for i in (seq (count $subcommands))
                if [ $currentCommands[(math (count $expectedCommands) + 1)] = $subcommands[$i] ]
                    return 1
                end
            end
        end
        return 0
    end
    return 1
end

complete -c mythic -n '_swift_mythic_using_command "mythic"' -l odds -s o -d 'An integer odds index (-4 to 4) for the Mythic Fate Chart.'
complete -c mythic -n '_swift_mythic_using_command "mythic"' -l chaos -s c -d 'An integer chaos factor (1 to 9) for the Mythic Fate Chart.'
complete -c mythic -n '_swift_mythic_using_command "mythic"' -l dice -s d -d 'An integer dice roll (1 to 100) for the Mythic Fate Chart. (optional)'
complete -c mythic -n '_swift_mythic_using_command "mythic"' -s h -l help -d 'Show help information.'
