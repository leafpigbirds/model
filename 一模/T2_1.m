angle=45.24;%����̫���߶Ƚ�
Ed=-23.43;%̫����γ
local=34.18;%����γ��
w=0;%̫��ʱ��
result=roots([1 -2*sind(angle)*sind(local) (sind(angle))^2-(cosd(local))^2] );
sinx_Ed=result(2);
a_Ed=acosd(sinx_Ed/-0.398);
day_Ed=a_Ed/0.9863+356;
day_Ed-365;
%�й���ʱ�����򡪡�������������������������������������������������������������������������
Ed=-23.43;
for i=0:182
    i%��52��
    asind (sind( Ed+0.25*i ) * sind( local ) + cosd( Ed+0.25*i ) * cosd( local ) )%�������̫���߶Ƚ�
end
Ed=23.43
for i=0:182
    i%��136��
    asind (sind( Ed-0.25*i ) * sind( local ) + cosd( Ed-0.25*i ) * cosd( local ) )%�������̫���߶Ƚ�
end
%������������������������������������������������������������������������������������������
%��267��