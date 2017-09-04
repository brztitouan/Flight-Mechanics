%US standard Atmosphere 1976, Geopotential Altitude to Pressure, Density, Temprature and speed of sound relation
function USATM = USAtmosphere(h)
    %clc
    %clear all
    
    P_base=[101325.00 22632.10 5474.89 868.02 110.91 66.94 3.96];
    T_base=[288.15 216.65 216.65 288.65 270.65 270.65 214.65];
    h_base=[0 11000 20000 32000 47000 51000 71000];
    r_base = [1.2250 0.36391 0.08803 0.01322 0.00143 0.00086 0.000064];
    g0=9.80665;
    M=0.0289644;
    R=8.3144598;

    %h=input("Enter Altitude in meter(s)");

    if h <= 11000 
        T=288.15-0.0065*(h-0);
        P = P_base(1) * exp(-g0*M*(h-h_base(1))/(R*T_base(1)));
        r = r_base(1) * exp(-g0*M*(h-h_base(1))/(R*T_base(1)));
    elseif (h > 11000) && (h<=20000)
        T=216.65;
        P = P_base(2) * exp(-g0*M*(h-h_base(2))/(R*T_base(2)));
        r = r_base(2) * exp(-g0*M*(h-h_base(2))/(R*T_base(2)));
    elseif (h > 20000) && (h<=32000)
        T=216.65+0.001*(h-20000);
        P = P_base(3) * exp(-g0*M*(h-h_base(3))/(R*T_base(3)));
        r = r_base(3) * exp(-g0*M*(h-h_base(3))/(R*T_base(3)));
    elseif (h > 32) && (h<=47)
        T=228.65+0.0028*(h-32000);
        P = P_base(4) * exp(-g0*M*(h-h_base(4))/(R*T_base(4)));
        r = r_base(4) * exp(-g0*M*(h-h_base(4))/(R*T_base(4)));
    elseif (h > 47000) && (h<=51000)
        T=270.65;
        P = P_base(5) * exp(-g0*M*(h-h_base(5))/(R*T_base(5)));
        r = r_base(5) * exp(-g0*M*(h-h_base(5))/(R*T_base(5)));
    elseif (h > 51000) && (h<=71000)
        T=270.65-0.0028*(h-51000);
        P = P_base(6) * exp(-g0*M*(h-h_base(6))/(R*T_base(6)));
        r = r_base(6) * exp(-g0*M*(h-h_base(6))/(R*T_base(6)));
    elseif (h > 71000) && (h<=84850)
        T=214.65-0.002*(h-71000);
        P = P_base(7) * exp(-g0*M*(h-h_base(7))/(R*T_base(7)));
        r = r_base(7) * exp(-g0*M*(h-h_base(7))/(R*T_base(7)));
    end
    a=sqrt(1.4 * 286.9 * T);
    USATM=[T,P,r,a];
end
