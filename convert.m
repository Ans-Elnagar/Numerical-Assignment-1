function [A,B,symbols] = convert( arr )
n=size(arr,1);

A=zeros(n,n);
B=zeros(n,1);
symbols=[];
str=arr(1,:);
for itr=2:n
   str=[str,',',arr(itr,:)];
end
symbols=symvar(str);
S = warning('off');
variables =sym(symbols);
lines =strsplit(str,',');

for itr=1:n
   [A(itr,:), B(itr)]=equationsToMatrix(sym(lines(itr)),variables);
end
warning(S);
end
