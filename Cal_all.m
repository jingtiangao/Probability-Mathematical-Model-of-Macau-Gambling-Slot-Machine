function award= Cal_all(max,award,S_indicator,numberC,S)
%UNTITLED6 �������еķ���
%   %��������score ����S_indicator ��score
 %��numberC��ÿһ�����м���������3 4 5 ��ֵ�����score
 %����ÿһ��S����

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
 
%sum(award) %�������
end

