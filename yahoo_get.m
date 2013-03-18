function data=yahoo_get(quote);
%quote='AAL.L'
%url='http://ichart.yahoo.com/table.csv?s=AAL.L&a=00&b=1&c=1999&d=03&e=3&f=2009&g=d&ignore=.csv';
%url=sprintf('http://ichart.yahoo.com/table.csv?s=%s&a=00&b=1&c=1900&d=19&e=6&f=2099&g=d&ignore=.csv',quote);
url=sprintf('http://ichart.finance.yahoo.com/table.csv?s=%s&a=00&b=1&c=1900&d=19&e=6&f=2099&g=d&ignore=.csv',quote);
url=java.net.URL(url);
is=url.openStream;
%Read stream of data
isr = java.io.InputStreamReader(is);
br = java.io.BufferedReader(isr);

%Parse return data
retdat = [];
next_line=' ';
lines=[];
fd=fopen([quote '.txt'],'w');
while ischar(next_line)
    tmp = br.readLine;
    try
        next_line = toCharArray(tmp)';
    catch
        break;
    end
    fprintf(fd,'%s\n',next_line);
    %lines=[lines;next_line];
end
fclose(fd);