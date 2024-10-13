
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%% INPUT DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Nose cone dimensions
%nose cone 4 inch diameter
d = 25.4*4; %mm
%nose cone length 
cl = 585; %mm
% shoulder length 
sl = 140;

%Shear pins used for nose cone section
%8 shear pins @53lbf + 100 lbf for drag
%shear pin force
nSP = 8*53*4.44822;
dF = 100*4.44822;

%booster dimensions
%length of booster section
bl = 422; %mm

%Shear pins used in booster section
%4 shear pins @53lbf + 100lbf for drag
bSP = 4*53*4.4482;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T = 273; %K
R = 0.08206; %Universal gas constant


%volume calculations
cv = pi*(((d^2)/4))*(cl/4); %mm^3
sv = sl*pi*((d^2)/4); %mm^3
%nose cone volume
nvmm = sv + cv;
nvL = nvmm/1e6;


%volume calculations
bvmm = bl*pi*((d^2)/4); %mm^3
%volume of bottom section
bvL = bvmm/1e6; %mm^3 to liters

%area of tube
A = pi*((d^2)/4); %mm^2

%pressure = F/A;
%force for nose cone

nf = nSP + dF;
nPpas = (nf/A)*1000000;
nP = convpres(nPpas, 'Pa', 'atm'); % convert pascal to atm

%number of moles co2
nmoles = (nP*nvL)/(R*T);
%1 mole of co2 weighs 44 grams
nCO2 = nmoles*44;
disp(['The quantity of CO2 required for the nose cone section is ', num2str(nCO2),' grams'])

%force for bottom section
bf = bSP + dF;
bPpas = (bf/A)*1000000; %convert mm^3 to liters
bP = convpres(bPpas, 'Pa', 'atm'); % convert pascal to atm

%number of moles co2
bmoles = (bP*bvL)/(R*T);%1 mole of co2 weighs 44 grams
%1 mole of co2 weighs 44 grams
bCO2 = bmoles*44;
disp(['The quantity of CO2 required for the booster section is ', num2str(bCO2),' grams'])

