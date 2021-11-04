function a= Eraser(max,S_indicator,S,a)
%消除的时候再把特殊字母变成百搭字母 把 百搭字母消除 然后其他的不变
%这里加上特殊字母的判断 特殊字母变成百搭字母 百搭字母进行消除
%这里外循环是循环 S 内循环是根据S_indicator去找每一个行的前几个元素 去替换他们
for i=1:1:max
    %先看到S[i]的指示变量是不是等于0
    %如果指示变量不等于0 就替换 否则跳过
    if (S_indicator(i)~= 0)
                   for j=1:1:S_indicator(i)
                       for k=1:1:4
                           %等于这个元素
                           if (a(k,j)==S(i))     
                               a(k,j)=0;%赋值为0
                               
                              %等于百搭元素
                            elseif(a(k,j)==9)
                                a(k,j)=0;%赋值为0
                                %等于特殊元素
                            elseif(a(k,j)==(S(i)+9))
                                a(k,j)=19;
                           end
                       end
                   end
    else
        %指示变量等于0就跳过
    end
end
    %再把等于19的元素变成9 如果是特殊字母的话消去变成19 最后再变成9百搭字母
   for i=1:1:4
       for k=1:1:5
           if(a(i,k)==19)
               a(i,k)=9;
           end
       end
   end
   
end

