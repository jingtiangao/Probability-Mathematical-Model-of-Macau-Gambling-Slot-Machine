function  sco=cal_score(x,num)
%x��Ԫ�ض�Ӧ��ĸ num������
%   �˴���ʾ��ϸ˵��
sco=0;
if num==3
    if x==1
       sco=0.1;
    end
    if x==2
       sco=0.1;
    end
    if x==3
       sco=0.2;
    end
    if x==4
       sco=0.2;
    end
    if x==5
       sco=0.3;
    end
    if x==6
       sco=0.4;
    end
    if x==7
       sco=0.5;
    end
    if x==8
       sco=0.75;
    end


  
end
if num==4
if x==1
       sco=0.25;
    end
    if x==2
       sco=0.25;
    end
    if x==3
       sco=10;
    end
    if x==4
       sco=10;
    end
    if x==5
       sco=0.75;
    end
    if x==6
       sco=1;
    end
    if x==7
       sco=2;
    end
    if x==8
       sco=3;
    end
end
if num==5
if x==1
       sco=0.5;
    end
    if x==2
       sco=0.5;
    end
    if x==3
       sco=1;
    end
    if x==4
       sco=1;
    end
    if x==5
       sco=2;
    end
    if x==6
       sco=3;
    end
    if x==7
       sco=4;
    end
    if x==8
       sco=5;
    end
end
if num==0
    sco=0;
end
end

