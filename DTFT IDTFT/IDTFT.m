clear all;
close all;
clc;
n=-50:50;
%%%%%unit impulse function%%%%%%
for ii=1:length(n)
    if(n(ii)==0)
        x(ii)=1;
    else
        x(ii)=0;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%unit step function%%%%%
% for ii=1:length(n)
%      if(n(ii)>=0)
%         x(ii)=1;
%      else
%          x(ii)=0;
%      end
%  end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%one sided exponential%%%%%%
% alpha=0.5;
% for ii=1:length(n)
%     if(n(ii)>=0)
%         x(ii)=alpha.^n(ii);
%     else
%         x(ii)=0;
%     end
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%double sided exponential%%%%%%
%x=(-0.9).^n;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%sin signal%%%%%
% amp=1 ; m=1 ; N=10;
% for ii=1:length(n)
%     x(ii)=amp*sin(2*pi*m/N*n(ii));
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%rectangular %%%%%%%%
% N=5 ;
% for ii=1:length(n)
%     if(n(ii)<-N)
%         x(ii)=0;
%     elseif (n(ii)>N)
%         x(ii)=0;
%     else
%         x(ii)=1;
%     end
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%sinc function%%%%%%
% N=5;
% for ii=1:length(n)
%     if(n(ii)==0)
%         x(ii)=1/N;
%     else
%         x(ii)=(1/N)*(sin(n(ii)*pi/N)/n(ii)*pi/N);
%     end
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




subplot(3,2,1:2);
stem(n,x);
xlabel('n');
ylabel('x(n)');
title('discrete time sequence');

omega=-4*pi:0.01:4*pi;
Xtemp=[];
X=[];
for a=1:length(omega)
    for b=1:length(n)
        Xtemp=[Xtemp (x(b)*exp(-j*omega(a)*n(b)))];
    end
    Xtemp=sum(Xtemp);
    X=[X Xtemp];
    Xtemp=[];
end
magx=abs(X);
subplot(3,2,3:4);
plot(omega,magx); grid;
xlabel('freq in pi');
ylabel('magnitude of X(omega)');
title('magnitude plot');
stepsize=(2*pi/length(x));
TF=[];
xrecons=[];
for a=1:length(n)
    for b=1:length(omega)
        Xtemp=[Xtemp X(b)*exp(j*omega(b)*n(a))];
    end
    TF=(1/(2*pi))*((stepsize/2)*(Xtemp(1,1)+Xtemp(1,end)+(2*sum(Xtemp(1,2:end-1)))));
    xrecons=[xrecons TF];
    TF=[];
    Xtemp=[];
end
subplot(3,2,5:6);
stem(n,xrecons);
xlabel('n');
ylabel('x(n)');
title('reconstructed x(n)');
