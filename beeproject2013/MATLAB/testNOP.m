%nrm = [1/3,1/8,1/15,1/16,1/6,1/12]'; % normalize frequencies for each
%stage

% First Season Summer Dynamics 
%function  H3 = testNOP(surX) 
agemax = 60; % +1 because of matlab indexing
global qh st1 st2 st3 st4 st5 st6;
global FactorBroodNurse u v rt foragingsuccess Q nt; 
 global hsurfX hsurfY hsurf V0;
 global a1 a2 a3 a4 a5 a6 h1 h2 h3 h4 h5 h6; %%%cosumption rate of honey and pollen  for each stage of bees 
 global tel tlp tpn tnh thf;
 %BRM=[0 0.2 0.4 0.6 0.8 1 2 4 5 6 ];
 %%%%%Parameter 
%Pamx=[st1 st2 st3 mt4 st5 st6];
% % 
% st1=surX(1);st2=surX(2);st3=surX(3);
% st4=surX(4);
% st5=surX(5);st6=surX(6); qh=surX(7);
% tel=surX(8);
% tlp=surX(9);
% tpn=surX(10);
% tnh=surX(11);
% thf=surX(12);
% u=surX(13)-0.98;v=surX(14)-0.98;rt=surX(15)-0.98;FactorBroodNurse=4*surX(16);
% %u=surX(7);v=surX(8)/10;rt=surX(9)/10;FactorBroodNurse=8*surX(10)
% % % 
% u=surX(1);
% v=surX(2);
% u=0.0000000000000000;%precocious prob
u=0.;
 v=0.00000;% reversed prob. between foragers and house bees;
 FactorBroodNurse=3; % One nurse bee can heat 2.65 brood cells 
 rt=0;
 qh=1;
%h1=0.12; % fraction of a cell's honey consumed by a bee in one day, a cellful of honey weighs~~0.5g
%h1=0;
h1=0.0;
% h2=0.012;
h2=0; 
% h3=0;
% %h4=0.1;
% %h4=0.036; 
% %h4=0.042;
% h4=0.042;
% h5=0.042;
% %h5=0.036;
% %h6=0.09; 
% % h6=0.1;
% h1=0.0186;
% h2=0.0186;
%h2=0;
%h4=0.0525;
%h4=0.0525;
h4=0.0525;
h5=0.045;
% h4=0.1;
% h5=0.1;
h6=0.136;
%h6=0.136;
%h6=0.1;



%a1 = .0; %  a cellful of pollen weighs~~0.23g
%a2 = .005; % fraction of a cell's pollen consumed by a larva in one day
%a1=0.0047;
a1=0;
a2=0.0047;
a4=0.0283;
a5=0;
% a2=0.0283;
% a3 = .0;
% a4 = .0283; % fraction of a cell's pollen consumed by a nurse in one day
%a5 = 0.017; % fraction of a cell's pollen removed by a house bee in one day
% a6=.00;
st2=0.5;
st1=0.5;


% st1=0.86; % 0.86--survivorship for egg stage 
% st2= 0.85; %---survivorship for larval stage 
st3= 0.86;
st4= 0.85; % 0.99-85%--survivorship for nurse bee stage 
st5=0.88; % 0.96-88.6%--survivorship for house bee stage 
st6=0.78; % 78.5%--survivorship for forager bee stage

% theta = rt*ones(agemax-1,1); % theta = probabilities of development retardation
%rt=0.0000000;

%st4= 0.97; % 0.86--survivorship for egg stage 
% st1=1;
% st2=1;st3=1;st4=1;st5=1;st6=1;
% st1= 0.97; % 0.86--survivorship for egg stage 
% st2= 0.99; %---survivorship for larval stage 
% st3= 0.999;
% st4= 0.995; % 0.99-85%--survivorship for nurse bee stage 0.97-nurse bee threshold 
% st5=0.995; % 0.96-88.6%--survivorship for house bee stage 
% st6=0.965; % 78.5%--survivorship for forager bee stage
%%Control survival
% st1=(0.86)^(1/3); % 0.86--survivorship for egg stage 
% st2= (0.85)^(1/7); %---survivorship for larval stage 
% st3= (0.86)^(1/14);
% st4= (0.85)^(1/16); % 0.99-85%--survivorship for nurse bee stage 
% st5=(0.85)^(1/6); % 0.96-88.6%--survivorship for house bee stage 
% st6=(0.78)^(1/12); % 78.5%--survivorship for forager bee stage
% % % global tel tlp tpn tnh thf;
%%max surivival
% st1=(1)^(1/3); % 0.86--survivorship for egg stage 
% st2= (1)^(1/7); %---survivorship for larval stage 
% st3= (1)^(1/14);
% st4= (1)^(1/16); % 0.99-85%--survivorship for nurse bee stage 
% st5=(1)^(1/6); % 0.96-88.6%--survivorship for house bee stage 
% st6=(1)^(1/12); % 78.5%--survivorship for forager bee stage

%%%%Min survival
% st1=(0.5)^(1/3); % 0.86--survivorship for egg stage 
% st2= (0.5)^(1/7); %---survivorship for larval stage 
% st3= (0.5)^(1/14);
% st4= (0.5)^(1/16); % 0.99-85%--survivorship for nurse bee stage 
% st5=(0.5)^(1/6); % 0.96-88.6%--survivorship for house bee stage 
% st6=(0.5)^(1/12); % 78.5%--survivorship for forager bee stage
tel=1;
tlp=1;
tpn=1;
tnh=1;
thf=1;
% st1= 0.85^(1/3); % 0.86--survivorship for egg stage 
% st2= 0.904^(1/8); %---survivorship for larval stage 
% st3= 0.988^(1/15);
% mt4= 1-0.976^(1/16); % 0.99-85%--survivorship for nurse bee stage 
% st5=0.86^(1/6); % 0.96-88.6%--survivorship for house bee stage 
% st6=0.78^(1/12); % 78.5%--survivorship for forager bee stage

% %%%%Dimethoate Control 

% st1=(0.85)^(1/3); % 0.86--survivorship for egg stage 
% st2= (0.85)^(1/7); %---survivorship for larval stage 
% st3= (0.86)^(1/14);
% st4= (0.6)^(1/16); % 0.99-85%--survivorship for nurse bee stage 
% st5=(0.85)^(1/6); % 0.96-88.6%--survivorship for house bee stage 
% st6=(0.78)^(1/12); % 78.5%--survivorship for forager bee stage


%%%%Fungicide Wax%%%%%%%%% the emergence levels of 1st instar larvae was
%%%%reduced significantly. 
% st1=(0.08)^(1/3); % 0.86--survivorship for egg stage 
% st2= (0.85)^(1/7); %---survivorship for larval stage 
% st3= (0.86)^(1/14);
% st4= (0.85)^(1/16); % 0.99-85%--survivorship for nurse bee stage 
% st5=(0.85)^(1/6); % 0.96-88.6%--survivorship for house bee stage 
% st6=(0.78)^(1/12); % 78.5%--survivorship for forager bee stage

%nt=0.1;

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
G = zeros(6,agemax);
tx=240;
G(1,1:3)=1; G(2,4:11)=1; G(3,12:26)=1; G(4,27:42)=1;G(5,43:48)=1;G(6,49:agemax)=1;

P0 = 1000;

V0 = 140000 - P0;

H0=0;

R0=0;

N = zeros(agemax,1);

N(1:3)=100;

N(4:11)=100;

N(12:26)=300;

N(27:42)=200;

N(43:48)=200;

N(49:agemax)=200;

X = [ V0; P0; H0;R0; N ];

res=zeros(6,tx);

V=zeros(1,tx);

P=zeros(1,tx);

H=zeros(1,tx);

R=zeros(1,tx);


numyears =1;
summerdays = 240;
yeardays = 360;

pop=zeros(6,yeardays*numyears);
Vpop=zeros(1,yeardays*numyears);
Ppop=zeros(1,yeardays*numyears);
Hpop=zeros(1,yeardays*numyears);
Rpop=zeros(1,yeardays*numyears);


%%pesticide application time for FPE study 
startdate=0;
enddate=0;

for T = 0:(numyears-1)

          for t=(yeardays*T+1):(yeardays*T+summerdays)


              
		     X = bees(X,t);

		     res(1:6,t-yeardays*T)=G*X(5:end);
 
		     V(1,t-yeardays*T)= X(1);

		     P(1,t-yeardays*T)= X(2);
        
             H(1,t-yeardays*T)= X(3);

		     R(1,t-yeardays*T)= X(4);
 
          end
     
%     pollen=P(1,yeardays*T+summerdays);
%     
%     Honey= H(1,yeardays*T+summerdays);
    
	pop(:,(yeardays*T+1):(yeardays*T+summerdays))=res;
    Vpop(:,(yeardays*T+1):(yeardays*T+summerdays))=V;
    Ppop(:,(yeardays*T+1):(yeardays*T+summerdays))=P;
    Hpop(:,(yeardays*T+1):(yeardays*T+summerdays))=H;
    Rpop(:,(yeardays*T+1):(yeardays*T+summerdays))=R;
% 	
%     if pop(4,(yeardays*T+1):(yeardays*T+summerdays))+pop(5,(yeardays*T+1):(yeardays*T+summerdays))<1000
%         
%           
%          fprintf('colony collapse');
%         break 
%     else 
%  
    
    % First Season Winter Dynamics 

	agemaxwinter=150; 

	W = zeros(4,agemaxwinter);

	W(1,1:3)=1; W(2,4:11)=1; W(3,12:26)=1; W(4,27:agemaxwinter)=1;

	N = zeros(agemaxwinter,1);

	N(1:3)=res(1,summerdays)/3;

	N(4:11)=res(2,summerdays)/8;

	N(12:26)=res(3,summerdays)/15;

	N(27:agemaxwinter)=(res(4,summerdays)+res(5,summerdays)+res(6,summerdays))/100;

	P0 = P(1,summerdays);

    V0 = V(1,summerdays);

    H0 = H(1,summerdays);

    R0 = R(1,summerdays);
    

    Y = [ V0; P0; H0;R0; N ];

	clear res V P H R;

	res=zeros(6,yeardays-summerdays);
    
    V=zeros(1,yeardays-summerdays);

    P=zeros(1,yeardays-summerdays);

    H=zeros(1,yeardays-summerdays);

    R=zeros(1,yeardays-summerdays);
    	

	for t=(yeardays*T+summerdays+1):(yeardays*(T+1))

		Y = winterbeesR(Y,t);

		res(1:4,(t-(yeardays*T+summerdays)))=W*Y(5:end);
      
        V(1,(t-(yeardays*T+summerdays)))= Y(1);

        P(1,(t-(yeardays*T+summerdays)))= Y(2);
    
        H(1,(t-(yeardays*T+summerdays)))= Y(3);

        R(1,(t-(yeardays*T+summerdays)))= Y(4);
        
     
    end 
    
	pop(:, (yeardays*T+summerdays+1):(yeardays*(T+1))) =res;
    
    Vpop(1,(yeardays*T+summerdays+1):(yeardays*(T+1)))= V;
    
    Ppop(1,(yeardays*T+summerdays+1):(yeardays*(T+1)))= P;
    
    Hpop (1,(yeardays*T+summerdays+1):(yeardays*(T+1)))= H;
    
    Rpop (1,(yeardays*T+summerdays+1):(yeardays*(T+1)))= R;
    
        
    
%     
%      
           
	%Second Season Summer Dynamics 

	N = zeros(agemax,1);

	N(1:3)=pop(1,yeardays*(T+1))/3;

	N(4:11)=pop(2,yeardays*(T+1))/8;

	N(12:26)=pop(3,yeardays*(T+1))/15;

	N(27:42)= pop(4,yeardays*(T+1))/34;

	N(43:48)= pop(4,yeardays*(T+1))/34 ;

	N(49:agemax)=pop(4,yeardays*(T+1))/34;

	P0 = Ppop(1,yeardays*(T+1));

	V0 = Vpop(1,yeardays*(T+1));

	R0= Rpop(1,yeardays*(T+1));
    
    H0= Hpop(1,yeardays*(T+1)); 

	X = [ V0; P0; H0; R0; N];

	res=zeros(6,summerdays);

	R=zeros(1,summerdays);

	V=zeros(1,summerdays);

	P=zeros(1,summerdays);

    H= zeros(1,summerdays); 
%     else 
%          fprintf('colony collapse');
%         break 
%     end
end 
%NOP-normal operating point 
% HoneystoreF1=Hpop(241);% First November-F1
% AdultBeesF1=pop(4,241);
% 
% HoneystoreW1=Hpop(360);% First End of One season-Next Feb-W1
% AdultBeesW1=pop(4,360);
% 
% HoneystoreF2=Hpop(601);% Second November-F2
% AdultBeesF2=pop(4,601);
% 
% HoneystoreW2=Hpop(720);% Second End of One season-Second Feb-W2
% AdultBeesW2=pop(4,720);
% 
% 
% HoneystoreF3=Hpop(961);% Third November-F3
% AdultBeesF3=pop(4,961);
% 
% HoneystoreW3=Hpop(1080);% Third End of One season-Second Feb-W2
% AdultBeesW3=pop(4,1080);
% 
% ABRatio=(pop(4,1:360*numyears)+ pop(5,1:360*numyears)+pop(6,1:360*numyears))./(pop(1,1:360*numyears)+pop(2,1:360*numyears)+pop(3,1:360*numyears)); 
 BARatio=(pop(1,1:360*numyears)+pop(2,1:360*numyears))./(pop(4,1:360*numyears)+pop(5,1:360*numyears)); 
%  %BARatio=(pop(1,1:360*numyears)+pop(2,1:360*numyears)+pop(3,1:360*numyears))./(pop(4,1:360*numyears)+ pop(5,1:360*numyears)+pop(6,1:360*numyears));
% % %ELPARatio=(pop(1,1:360*numyears)+pop(2,1:360*numyears)+pop(3,1:360*numyears))./(pop(4,1:360*numyears)+ pop(5,1:360*numyears));
 FARatio=pop(6,1:360*numyears)./(pop(4,1:360*numyears)+pop(5,1:360*numyears));

 %BNy=[BARatio;FARatio];
 %BNy=BARatio';
% save NOPAdultBeesF1.dat AdultBeesF1 -ascii
% save NOPAdultBeesF2.dat AdultBeesF2 -ascii
% save NOPAdultBeesF3.dat AdultBeesF3 -ascii
% 
% save NOPAdultBeesW1.dat AdultBeesW1 -ascii
% save NOPAdultBeesW2.dat AdultBeesW2 -ascii
% save NOPAdultBeesW3.dat AdultBeesW3 -ascii
% 
% 
% save NOPHoneystoreW1.dat HoneystoreW1 -ascii
% save NOPHoneystoreW2.dat HoneystoreW2 -ascii
% save NOPHoneystoreW3.dat HoneystoreW3 -ascii
% 
% save NOPHoneystoreF1.dat HoneystoreF1 -ascii
% save NOPHoneystoreF2.dat HoneystoreF2 -ascii
% save NOPHoneystoreF3.dat HoneystoreF3 -ascii
% 
% load NOPAdultBeesF1.dat
% load NOPAdultBeesF2.dat
% load NOPAdultBeesF3.dat
% load NOPAdultBeesW1.dat
% load NOPAdultBeesW2.dat
% load NOPAdultBeesW3.dat
% 
% 
% load NOPHoneystoreW1.dat
% load NOPHoneystoreW2.dat
% load NOPHoneystoreW3.dat
% load NOPHoneystoreF1.dat
% load NOPHoneystoreF2.dat
% load NOPHoneystoreF3.dat

% % 
 %figure(1);
 %figure;
YMatrix1=pop';
A=Ppop;
B=Hpop;
% A=Ppop.*0.23/1000;
% B=Hpop*0.5/1000;
YMatrix2= [A;B]';
 Y3=Rpop;
%Y3=pop(3)*0.1552/1000+pop(4)*0.2189/1000+pop(5)*0.2189/1000+A+B;
createfigure1(YMatrix1, YMatrix2, Y3); 

%hold off;
figure;

 plot(Y3);
foundationweight = 50.2 * 453.6 /1000;

Y1=(pop(2)+pop(3))*0.1552/1000+pop(4)*0.2189/1000+pop(5)*0.2189/1000+Ppop.*0.23/1000+Hpop*0.5/1000;
 plot(Y1(1:360));
t=[0:30:360];months=['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec';];
set(gca,'xtick',t)
set(gca,'xticklabel',months)
xlabel('Date')
ylabel('Colony Weight')


% figure;
% Ypollen=A;
%  plot(A(1:360));
% t=[0:30:360];months=['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec';];
% set(gca,'xtick',t)
% set(gca,'xticklabel',months)
% xlabel('Date')
% ylabel('Pollen Weight')
 %YMatrix1=[pop(1,:)+pop(2,:)+pop(3,:);pop(4,:)+pop(5,:)+pop(6,:)]';
%  A=Ppop';
%  B=Hpop';
% % % %YMatrix2= [A;B]';
%  BNy1=pop(4,:)+pop(5,:)+pop(6,:);
% % %BNy1=pop(4,:)+pop(5,:)+pop(6,:)+pop(1,:)+pop(2,:)+pop(3,:);
% % % 
% Rd=zeros(1079,1);
% for i=1:1079
%     AD(i+1)=BNy1(i+1);
%     AD(i)=BNy1(i);
%     Rd(i)=log(AD(i+1))-log(AD(i));
% end 
% 
% % N1=BNy1(1);
% % N240=BNy1(240);
% % N360=BNy1(360);
% % N600=BNy1(600);
% % N720=BNy1(720);
% % N960=BNy1(960);
% % %N1080=BNy1(1080);
% % lamda1=(log(N240)-log(N1))/240;
% % lamda2=(log(N600)-log(N360))/240;
% % lamda3=(log(N960)-log(N720))/240;
% % Nmax=max(BNy1);
%BNy=BARatio(90)+FARatio(90);
BNy=(BARatio+FARatio)';
% % P1=A(240);
% % P2=A(600);
% % P3=A(960);
% % H1=B(240);
% % H2=B(600);
% % H3=B(960);
% %BNy=BNy1(720);
% %growthrate=
% % %yeardays*T+summerdays
% YMatrix2= A';
% Y1=Rd';
% createfigure1(YMatrix1, YMatrix2,Y1); 
%return 
