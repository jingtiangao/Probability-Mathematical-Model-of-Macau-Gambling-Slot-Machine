%���ؿ��巽���������ģ��
%�ؼ���д�����ж��н��������������
%�ȿ���һ���м�����һ������ 
%���� S������
%��Ҫ֪���н��Ĺ�����ĸ һ���м��� ÿһ���м���
%��A-H ��ʾ1-8  �ٴ���ĸJ Ϊ9 ����Ϊ10-17  ����ͨ��9�Ĳ�� ����Ԫ�����ɵİٴ�Ԫ����19֮���ٸĻ���
%award ��ʾ �н���ĸ ���� 
%����ƽ��sum
function [fen,dis_S]= game(pp,pp1,dis_S)

sumall=0;
%�ۼƱ���
N=10000;

for q=1:N
%����
luke=0;
numluke=0;
Mul=1;
%�ۼƵ��������
roll=0;
award_score=0;
%����a����ȫ0��
a=[0,0,0,0,0;0,0,0,0,0;0,0,0,0,0;0,0,0,0,0;];

while(1)
%���￪ʼѭ�� ֻҪ����͸�ֵ
%����
%a=[3,1,1,4,5;1,10,2,9,5;3,2,1,1,1;2,1,3,4,5;]
%��һ��ѭ�� �Ե�һ��ÿһ��Ԫ���ж�
%�ڶ��� ���ڶ�����û�� �еĻ��� numberC����λ��+1
%������ʼ�� a����4*5�ľ���
%˳��ΪA-H J ���� I 
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
  %�ٰѵ���0��Ԫ���ö�Ԫ�ֲ���ʼ��
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
numberC=zeros(max); %ÿһ���м��������������numberC
S_indicator=zeros(max,1);
award=zeros(max,1);
%��ÿһ���м���Ԫ�����



%�����аٴ���ĸJ ��������ĸ���ж�
numberC = Cal_numberC(max,numberC,a,S);
 %�ж�numberC�Ƿ��н�
 %����н��� �ͼ�¼���� S_indicator��Ϊ�Ǹ�����
  S_indicator = Cal_award(max,numberC,S_indicator);
  %S_indicator
  %�н��˾ͼ�һ�� ����Ͱ��������0
  if(sum(S_indicator)>0)
  roll=roll+1;
  roll
  %ÿһ�ֶ�Ҫ��һ������
  
      %��ͨ�ĵ��������������
      if (roll==7)
      break;
      end
      else
              %�������������Ļ��������ˣ��ټ���ȥ�������û�roll Ϊ0  �������roll
              %Ϊ0�Ļ�����һ�������ǲ���0����0���Ǿͽ���������������˼�һ �Ѿ�����0  ��������ҲҪ��
              %�����ǲ���0�����˲�����Ļ�Ҫ��2
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
 %��������score ����S_indicator ��score
 %��numberC��ÿһ�����м���������3 4 5 ��ֵ�����score
 %����ÿһ��S���� ����Ҫ����һ���������������ж�
 %�ȿ����ǵڼ��ֵ�����
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
 %����������һ�ּ�����һ��
 award=Cal_all(max,award,S_indicator,numberC,S)
 award_score= award_score+Mul*sum(award)
 for p=1:1:max
  if(roll==1)
    dis_S(1,S(p))= dis_S(1,S(p))+Mul*award(p);
  else
      dis_S(2,S(p))= dis_S(2,S(p))+Mul*award(p);
  end
 end
  %��Ҫ����ÿһ��S[j]��õķ��� dis_S����ʾ ÿ�μ������ ��Ӧ������Ӧdis_S�ϼӷ�
 
 %������һ����������
%������ʱ���ٰ�������ĸ��ɰٴ���ĸ �� �ٴ���ĸ���� Ȼ�������Ĳ���
%�������������ĸ���ж� ������ĸ��ɰٴ���ĸ �ٴ���ĸ��������
%������ѭ����ѭ�� S ��ѭ���Ǹ���S_indicatorȥ��ÿһ���е�ǰ����Ԫ�� ȥ�滻����
%�Ƚ����滻 �ٰ��滻�����Ĳ���ͨ��0�����û�
a= Eraser(max,S_indicator,S,a);

end
%��������ۼƱ���������  ����Ӧ����һ����ǰ���ۼƱ��� 
%���������Ӧ����������ɳɶ���ֲ�����
%���Ƿ��н����������
%�н����������ɷֲ���
%���ȿ��Ƿ��н� ����������ĸ��������Ƿ����꣬û����ͼ���һ����ѭ�� ����һֱ�����н����������������ֹͣ��
%��� �н�һ���ۼƱ����͸��� ������˲�Ϊ0 ��ô����������������� 

%%%%%%%%%%%
end
%%%%%%%%%%%%
%%%%����for���� ���� ƽ����
%%%%%%%%%
sumall=sumall/N;
sumall
fen=abs(sumall-0.95);
fen
%fen=sumall;
 