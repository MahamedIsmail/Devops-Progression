: 'File Operations - Write a script that creates a directory, navigates into it, creates a file inside it, writes some text to the file, and then displays the contents of the file
'
#!/bin/bash

file_opertion(){
    mkdir -p "source_dir"
    cd "source_dir" 
    echo "creating sample files..."
    sample="Hello world !"
    echo "$sample" > "file1.txt"
    sample="Hello world to the secound file" 
    echo "$sample" > "file2.txt"
    for file in ./*;
    do 
    echo "Contents of $file: $(cat "$file")"
    echo "--------------------------------"
    done 


}
file_opertion
