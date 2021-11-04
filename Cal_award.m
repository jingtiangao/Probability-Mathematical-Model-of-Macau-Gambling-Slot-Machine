function S_indicator = Cal_award(max,numberC,S_indicator)
%计算并且判断是否中奖
%   此处显示详细说明
%判断numberC是否中奖
 %如果中奖了 就记录行数 S_indicator变为那个行数
 %这里加上特殊字母的判断 特殊字母变成百搭字母 百搭字母进行消除
 
 for i=1:1:max
    for s=1:1:5
        if(numberC(i,3)>0&&numberC(i,4)>0&&numberC(i,5)>0&&numberC(i,1)>0&&numberC(i,2)>0)
            S_indicator(i)=5;
        elseif(numberC(i,3)>0&&numberC(i,4)>0&&numberC(i,1)>0&&numberC(i,2)>0)
            S_indicator(i)=4;
        elseif(numberC(i,3)>0&&numberC(i,1)>0&&numberC(i,2)>0)
            S_indicator(i)=3;
        else
            S_indicator(i)=0;
        end
    end
  end
   %sum(S_indicator) %大于零即为中奖
end

