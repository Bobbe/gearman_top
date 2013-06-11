{
    width=30;
    separator="|";

    for (i=1; i<=NF; i++) {
        if (match($i, /[a-z_\-\:]/)) {
            printf("%-"width"s", $i);
        }
        else { 
            printf("%-15s", $i);
        }
        if (i == NF) printf("\n");
        else printf("%s", separator);
    }
}
