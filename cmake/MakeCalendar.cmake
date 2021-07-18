add_custom_target(calendar
    COMMAND python3 -m calendar
)

# This adds a custom command to a target such as a library or executable. This is useful for performing an operation before or after building the target. The command becomes part of the target and will only execute when the target itself is built. If the target is already built, the command will not execute
add_custom_command(TARGET calendar
    PRE_BUILD
    COMMAND echo -e "\texecuting a PRE_BUILD command"
    COMMENT "This command will be executed before building calendar"
    VERBATIM # to support \t for example
)

add_custom_command(TARGET calendar
    # Run after sources have been compiled but before linking the binary or running the librarian or archiver tool of a static library. This is not defined for targets created by the add_custom_target() command
    PRE_LINK
    COMMAND echo -e "\texecuting a PRE_LINK command"
    COMMENT "This command will be executed after building calendar"
    VERBATIM
)

add_custom_command(TARGET calendar
    # Run after all other rules within the target have been executed
    POST_BUILD
    COMMAND echo -e "\texecuting a POST_BUILD command"
    COMMENT "This command will be executed after building calendar"
    VERBATIM
)