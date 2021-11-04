function fen = test(p)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
dis_S=[0,0,0,0,0,0,0,0];
p=p';
pp=p(1,:);
pp1=p(2,:)
[fen,dis_S]=game(pp,pp1,dis_S)
end

