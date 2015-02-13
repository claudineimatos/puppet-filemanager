# puppet-filemanager
A simple puppet module to be used with Foreman which helps create files

Usage in YAML format:

filemanager:
  files:
    some_title:
    path: /path/to/the/file
    mode: 600
    content: bla bla bla
    owner: user_name
    group: group_name
    replace: true
    
Options:

mode
Specify file mode attributes (defaults to 600)

owner
Specify the owner of the file (defaults to root)

group
Specify the group of the file (defaults to root)

content
Specify the content of the file. For a multiline content use

replace
Specify if the file content should be replaced if it differs
