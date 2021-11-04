%蒙特卡洛方法计算概率模型
%关键是写出来判断中奖情况和消除规则
%先看第一列有几个不一样的数 
%存入 S矩阵中
%需要知道中奖的规则字母 一共有几列 每一列有几个
%用A-H 表示1-8  百搭字母J 为9 特殊为10-17  和普通是9的差距 特殊元素生成的百搭元素是19之后再改回来
%award 表示 中奖字母 列数 
%总体平均sum
function [fen,dis_S]= game(pp,pp1,dis_S)

sumall=0;
%累计倍数
N=10000;

for q=1:N
%幸运
luke=0;
numluke=0;
Mul=1;
%累计掉落的轮数
roll=0;
award_score=0;
%这里a等于全0阵
a=[0,0,0,0,0;0,0,0,0,0;0,0,0,0,0;0,0,0,0,0;];

while(1)
%这里开始循环 只要有零就赋值
%矩阵
%a=[3,1,1,4,5;1,10,2,9,5;3,2,1,1,1;2,1,3,4,5;]
%第一重循环 对第一列每一个元素判断
%第二重 看第二列有没有 有的话就 numberC所在位置+1
%参数初始化 a就是4*5的矩阵
%顺序为A-H J 特殊 I 
%p=[1/17,1/17,1/17,1/17,1/17,1/17,1/17,0/17,0/17,0/17,0/17,0/17,0/17,0/17,0/17,0/17,0/17];
%p=[1/8,1/8,1/8,1/8,1/8,1/8,1/8,1/8];
p=[pp(1),pp(2),pp(3),pp(4),pp(5),pp(6),pp(7),pp(8)];
%p=[462/480,0/80,3/480,3/480,3/480,3/480,3/480,3/480];
pd = makedist('Multinomial','Probabilities',p);
%p1=[462/480,0/80,3/480,3/480,3/480,3/480,3/480,3/480];
%p1=[1/8,1/8,1/8,1/8,1/8,1/8,1/8,1/8];
p1=[pp1(1),pp1(2),pp1(3),pp1(4),pp1(5),pp1(6),pp1(7),pp1(8),pp1(9),pp1(10),pp1(11),pp1(12),pp1(13),pp1(14),pp1(15),pp1(16),pp1(17),pp1(18)];
pd1 = makedist('Multinomial','Probabilities',p1);
 %rng('default');  % for reproducibility
  %再把等于0的元素用多元分布初始化
%    for i=1:1:4
%        if(a(i,1)==0)
%            if (roll==0)
%                 a(i,1)= random(pd);
%            else
%                a(i,1)= random(pd);
%                while ((histc(a(:,2), a(i,1))||histc(a(:,2), a(i,1)-9)||histc(S, a(i,1)-9))&&a(i,1)~=1)
%                      a(i,1)=random(pd)
%                 end
%            end
%        end
%        for k=2:1:5
%            if(a(i,k)==0)
%                 if (roll==0)
%                   a(i,k)=random(pd1);
%                 else
%                     a(i,k)=random(pd1);
%                     while (histc(a(:,1), a(i,k))||histc(S, a(i,k))||histc(a(:,1), a(i,k)-9)||histc(S, a(i,k)-9))
%                      a(i,k)=random(pd1);
%                     end
%                 end
%            end
%        end
%    end
   for i=1:1:5
       for k=1:1:4
           if k==1
                if (roll==0)
                a(i,k)= random(pd);
                else
                   a(i,1)= random(pd);
                   while ((histc(a(:,2), a(i,k))||histc(a(:,2), a(i,k)-9)))
                         a(i,k)=random(pd);
                   end
                end
                
           else
                if (roll==0)
                  a(i,k)=random(pd1);
                else
                    a(i,k)=random(pd1);
                    while (histc(a(:,1), a(i,k))||histc(S, a(i,k))||histc(a(:,1), a(i,k)-9)||histc(S, a(i,k)-9))
                     a(i,k)=random(pd1);
                    end
                end
           end
       end
   end


 a
 
S=unique(a(:,1));
max=size(S,1);
numberC=zeros(max); %每一列有几个用另外的向量numberC
S_indicator=zeros(max,1);
award=zeros(max,1);
%看每一列有几个元素组合



%这里有百搭字母J 和特殊字母的判断
numberC = Cal_numberC(max,numberC,a,S);
 %判断numberC是否中奖
 %如果中奖了 就记录行数 S_indicator变为那个行数
  S_indicator = Cal_award(max,numberC,S_indicator);
  %S_indicator
  %中奖了就加一轮 否则就把轮数变成0
  if(sum(S_indicator)>0)
  roll=roll+1;
  roll
  %每一轮都要加一下幸运
  
      %普通的掉落消除最多七轮
      if (roll==7)
      break;
      end
      else
              %连续消除结束的话，算幸运，再加上去，并且置换roll 为0  后面如果roll
              %为0的话，看一下幸运是不是0，是0我们就结束，不是零就幸运减一 把矩阵变成0  倍数那里也要看
              %幸运是不是0，幸运不是零的话要乘2
      roll=0;
      numluke=0;
             for i=1:1:4
                   for k=1:1:5
                          if (a(i,k)==18)
                          numluke=numluke+1;
                          end
                   end
             end
             if(numluke~=0)
                 luke=luke+2*(numluke-3)+12;
             end
      end
              
         
  if(roll==0)
      if(luke>0)
              roll=0;
              luke=luke-1;
               for i=1:1:4
                   for k=1:1:5
                           a(i,k)=0;
                   end
               end
      
      else
              roll=0;
              luke=0;
             %if(award_score>0)
              award_score
              sumall=award_score+sumall;
              %sumall=1+sumall;
            %  end
            award_score=0;
              break;
      end
  end
 %接下俩算score 根据S_indicator 算score
 %对numberC的每一行算有几个连续的3 4 5 赋值后计算score
 %对于每一个S都算 这里要乘以一个倍数还有幸运判断
 %先看这是第几轮掉落了
 if(roll>=4)
 Mul=5;
 
   if(luke>0)
   Mul=10;
   end
 else
  Mul=roll;
   if(luke>0)
   Mul=2*roll;
   end
 end
 %分数等于上一轮加上这一轮
 award=Cal_all(max,award,S_indicator,numberC,S)
 award_score= award_score+Mul*sum(award)
 for p=1:1:max
  if(roll==1)
    dis_S(1,S(p))= dis_S(1,S(p))+Mul*award(p);
  else
      dis_S(2,S(p))= dis_S(2,S(p))+Mul*award(p);
  end
 end
  %还要计算每一个S[j]获得的分数 dis_S来表示 每次计算完成 都应该在相应dis_S上加分
 
 %这里有一个消除操作
%消除的时候再把特殊字母变成百搭字母 把 百搭字母消除 然后其他的不变
%这里加上特殊字母的判断 特殊字母变成百搭字母 百搭字母进行消除
%这里外循环是循环 S 内循环是根据S_indicator去找每一个行的前几个元素 去替换他们
%先进行替换 再把替换结束的部分通过0进行置换
a= Eraser(max,S_indicator,S,a);

end
%下面就是累计倍数和消除  所以应该有一个当前的累计倍数 
%整体的流程应该是先随机成成多项分布矩阵
%看是否中奖并计算分数
%中奖后重新生成分布数
%再先看是否中奖 或者幸运字母随机次数是否用完，没用完就减少一次再循环 最终一直到不中奖并且免费随机用完就停止，
%如果 中奖一次累计倍数就更改 如果幸运不为0 那么倍数会根据轮数增加 

%%%%%%%%%%%
end
%%%%%%%%%%%%
%%%%总体for结束 计算 平均数
%%%%%%%%%
sumall=sumall/N;
sumall
fen=abs(sumall-0.95);
fen
%fen=sumall;
 