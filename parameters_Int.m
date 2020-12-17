parameters;
A1 = [A , zeros(n,m) ; 
      -Cr ,zeros(m,m);];
B1 = [B;zeros(m,m)];
% rank(ctrb(A1,B1))
des_poles_Int = [des_poles_ctrb; -12; -12];
K_Int = place(A1,B1,des_poles_Int);
K = K_Int(:,1:n);
Ki = K_Int(:,n+1:end);

xr = zeros(n,1);
ref_state = [pi/6;pi/4];