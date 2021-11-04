function award= Cal_all(max,award,S_indicator,numberC,S)
%UNTITLED6 计算所有的分数
%   %接下俩算score 根据S_indicator 算score
 %对numberC的每一行算有几个连续的3 4 5 赋值后计算score
 %对于每一个S都算

for j=1:1:max
     if S_indicator(j)==3
        award(j) = cal_score(S(j),S_indicator(j))*numberC(j,1)*numberC(j,2)*numberC(j,3);
     elseif S_indicator(j)==4
        award(j)= cal_score(S(j),S_indicator(j))*numberC(j,1)*numberC(j,2)*numberC(j,3)*numberC(j,4);
     elseif S_indicator(j)==5
        award(j)= cal_score(S(j),S_indicator(j))*numberC(j,1)*numberC(j,2)*numberC(j,3)*numberC(j,4)*numberC(j,5);
     else
         award(j)=0;
     end
 end
 
%sum(award) %总体分数
end

