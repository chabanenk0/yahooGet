function [y,ndata]=get_quote_close_alldates(quotefile);
% возвращает ряд цен закрытия для данного актива по даным датам.
% Если даты отсутствуют - промежуток заполняется нулями. Если лишние -
% игнорируются
% Даты должны начинаться с сегодняшней и заканчиваться самой старой.
quotefd=fopen(quotefile,'r');

%curdate=curdate(1:length(curdate)-2);
currecord=fgets(quotefd);
y=[];
ndata=0;
n=0;
while ~feof(quotefd)
    currecord=fgets(quotefd);
    [date,close]=fetchrecordd(currecord);
    y=[y;close];
end

fclose(quotefd);

function [date,close]=fetchrecordd(currecord);
% обрабатывает запись и возвращает только дату и цену закрытия
delimpos=findstr(currecord,',');
if length(delimpos)>5
    date=currecord(1:delimpos(1)-1);
    closestr=currecord(delimpos(6)+1:length(currecord));
    close=str2num(closestr);
else
    date='9999-99-99';
    close=0;
end
