angle=45.24;%����̫���߶Ƚ�
Ed=-23.43;%̫����γ
local=34.18;%����γ��
w=0;%̫��ʱ��
sin_angle=sind(angle);
for i=0:182
    i
    sind( Ed+0.25*i )*sind( local )+cosd( Ed+0.25*i )*cosd( local )*cosd(-45)   %9���̫���߶Ƚ�
end %29�� 5��24��
% Ed=23.43;
% for i=0:182
%     i
%     sind( Ed-0.25*i )*sind( local )+cosd( Ed-0.25*i )*cosd( local )*cosd(-45)   %9���̫���߶Ƚ�
% end%33�� 7��25��

%ʱ������6Сʱ 62��



















% 
% % %6Сʱ����ʱ�����򡪡���������������������������������������������������������������������
% % Ed=-23.43;
% % for i=0:182
% %     i
% %     asind (sind( Ed+0.25*i ) * sind( local ) + cosd( Ed+0.25*i ) * cosd( local ) ) * cosd( -45 )
% % end
% % 
% % Ed=23.43;
% % for i=0:182
% %     i
% %     asind (sind( Ed-0.25*i ) * sind( local ) + cosd( Ed-0.25*i ) * cosd( local ) ) * cosd( -45 )
% % end
% 
% Ed=23.43;
% asind (sind( Ed ) * sind( local ) + cosd( Ed ) * cosd( local ) ) %�������̫���߶Ƚ�
% % acosd( ( sind(angle)-sind(Ed)*sind(local) )/( cosd(Ed)*cosd(local) ) ) %������С̫��ʱ��
%  
% Ed=23.43;
% for i=0:0.002:1
%     i
%     asind (sind( Ed ) * sind( local ) + cosd( Ed ) * cosd( local ) ) * i
% end
% % acosd(0.572);
% % per=( (55.11/15)*2 )/130;
% % sum=0;
% % for i=1:130
% %     sum=sum+per*i;
% % end
% % sum*2
% 
% 
% Ed=-23.43+0.25*51;
% cnt_t=0;
% for i=52:182
%     Ed=Ed+0.25;
%     t=acosd( ( sind(angle)-sind(Ed)*sind(local) )/( cosd(Ed)*cosd(local) ) );
%     cnt_t=cnt_t+2*abs(t)/15;
% end
% Ed=23.43;
% acosd( ( sind(angle)-sind(Ed)*sind(local) )/( cosd(Ed)*cosd(local) ) )%�ﵽ̫���߶Ƚǵ���С̫��ʱ��
% cnt_t
    