function key = make(filename)

ID = fopen(filename, 'r');
key = fscanf(ID, '%d');
fclose(ID);