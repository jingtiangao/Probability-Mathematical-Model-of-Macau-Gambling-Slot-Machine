function S_indicator = Cal_award(max,numberC,S_indicator)
%���㲢���ж��Ƿ��н�
%   �˴���ʾ��ϸ˵��
%�ж�numberC�Ƿ��н�
 %����н��� �ͼ�¼���� S_indicator��Ϊ�Ǹ�����
 %�������������ĸ���ж� ������ĸ��ɰٴ���ĸ �ٴ���ĸ��������
 
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
   %sum(S_indicator) %�����㼴Ϊ�н�
end

