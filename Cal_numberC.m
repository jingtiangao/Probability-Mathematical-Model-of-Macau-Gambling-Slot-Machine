function numberC = Cal_numberC(max,numberC,a,S)
%算numberC
%   %看每一列有几个元素组合
%这里有百搭字母J 和特殊字母的判断 
 for i=1:1:max
     for s=1:1:5
        if s<6
                %看第s列有几个 S[i]普通字母
                numberC(i,s) = histc(a(:,s),S(i));
                %看看s列有几个特殊字母  
                numberC(i,s) = numberC(i,s)+histc(a(:,s),S(i)+9);
                %看s列有几个百搭字母
                numberC(i,s) = numberC(i,s)+histc(a(:,s),9);
                %把他们加起来
               
        end
     end
 end
 
end

