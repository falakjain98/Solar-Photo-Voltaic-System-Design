n=15;
phi=input('Enter latitude in degrees : ');
llocal=input('Enter longitude of the place : ');
for i=1:12
    lstd=82.5;
    d=23.45*sind(360*(284+n)/365);
    B=360*(n-81)/364;
    EOT=9.87*sind(2*B)-7.53*cosd(B)-1.5*sind(B);
    w=zeros(1,15);
    watch=300;
    noon=720;
    a=1;
    while watch<=1140
        sol=(watch-(lstd-llocal)-EOT);
        w(1,a)=15*(sol-720)/60;
        watch=watch+60;
        a=a+1;
    end
    omega=cosd(w);
    alpha=asind(sind(d)*sind(phi)+omega.*(cosd(d)*cosd(phi)));
    gamma=acosd((sind(alpha)*sind(phi)-sind(d))./(cosd(alpha)*cosd(phi)));
    gamma(1:7)=-gamma(1:7);
    plot(gamma,alpha,'-*r');
    hold on;
    xlabel('Azimuth (degrees)');
    ylabel('Altitude (degrees)');
    n=n+30;
    if n==135
        n=255;
    end
end
hold off;
