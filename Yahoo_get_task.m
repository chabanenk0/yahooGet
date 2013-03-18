fd=fopen('list_all20111101.txt','r');
while ~feof(fd);
    quote=fgets(fd);
    quote=quote(1:length(quote)-2);
    
    yahoo_get(quote);
    [y,ndata]=get_quote_close_alldates_adjclose(strcat(quote,'.txt'));
    leny=length(y);
    y=y(leny:-1:1);
    dlmwrite(strcat(quote,'_close.txt'),y,'\n');
    %yahoo_get(quote);
end
close(fd);
