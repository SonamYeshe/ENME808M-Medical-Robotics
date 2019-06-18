syms t d(t) d_d(t) m_1 m_2 m_3 l_1 l_2 l_3 theta_1(t) theta_2(t) theta_1_d(t) theta_2_d(t) theta_1_dd(theta_1_d) theta_2_dd(theta_2_d)

f44 = m_1*l_1^2*diff(theta_1,t) + m_2*(l_1+d)^2*diff(theta_1,t) + m_3*(l_2^2*(diff(theta_1,t)+diff(theta_2,t)) + (l_1+d)^2*diff(theta_1,t) + (l_1+d)*l_2*cos(theta_2)*(2*diff(theta_1,t)+diff(theta_2,t)) - diff(d,t)*l_2*sin(theta_2));
% diff(f3, t)
% simplify(f3)
f45 = diff(f44,t);


f1 = 0.5 * m_1 * l_1^2 * theta_1_d^2;
f2 = 0.5 * m_2 * (diff(d,t)^2 + (l_1+d)^2 * diff(theta_1,t)^2);
f3 = 0.5*m_3*((-l_2*(diff(theta_1,t) + diff(theta_2,t))*sin(theta_1+theta_2)-(l_1+d)*sin(theta_1)*diff(theta_1,t) + diff(d,t)*cos(theta_1))^2 + (l_2*(diff(theta_1,t) + diff(theta_2,t))*cos(theta_1+theta_2) + (l_1+d)*cos(theta_1)*diff(theta_1,t) + diff(d,t)*sin(theta_1))^2);

% functionalDerivative(theta_1^2,theta_1)

% diff(functionalDerivative(f1,theta_1_d),t) 

f10 = m_3 * (l_1+d) * l_2 * cos(theta_2) * (2*diff(theta_1,t) + diff(theta_2,t));
diff(f10,t);
f11 = m_3 * (diff(theta_1,t) + diff(theta_2,t)) * l_2 * sin(theta_2);
diff(f11,t);
f12 = (d+l_1) * cos(theta_2) * diff(theta_1,t);
diff(f12,t)