angle=45.24;%所需太阳高度角
Ed=-23.43;%太阳赤纬
local=34.18;%地理纬度
w=0;%太阳时角
sin_angle=sind(angle);
for i=0:182
    i
    sind( Ed+0.25*i )*sind( local )+cosd( Ed+0.25*i )*cosd( local )*cosd(-45)   %9点的太阳高度角
end %29天 5月24日
% Ed=23.43;
% for i=0:182
%     i
%     sind( Ed-0.25*i )*sind( local )+cosd( Ed-0.25*i )*cosd( local )*cosd(-45)   %9点的太阳高度角
% end%33天 7月25日

%时常超过6小时 62天



















% 
% % %6小时光照时间区域————————————————————————————————————
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
% asind (sind( Ed ) * sind( local ) + cosd( Ed ) * cosd( local ) ) %夏至最大太阳高度角
% % acosd( ( sind(angle)-sind(Ed)*sind(local) )/( cosd(Ed)*cosd(local) ) ) %夏至最小太阳时角
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
% acosd( ( sind(angle)-sind(Ed)*sind(local) )/( cosd(Ed)*cosd(local) ) )%达到太阳高度角的最小太阳时角
% cnt_t
    