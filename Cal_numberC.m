function numberC = Cal_numberC(max,numberC,a,S)
%��numberC
%   %��ÿһ���м���Ԫ�����
%�����аٴ���ĸJ ��������ĸ���ж� 
 for i=1:1:max
     for s=1:1:5
        if s<6
                %����s���м��� S[i]��ͨ��ĸ
                numberC(i,s) = histc(a(:,s),S(i));
                %����s���м���������ĸ  
                numberC(i,s) = numberC(i,s)+histc(a(:,s),S(i)+9);
                %��s���м����ٴ���ĸ
                numberC(i,s) = numberC(i,s)+histc(a(:,s),9);
                %�����Ǽ�����
               
        end
     end
 end
 
end

