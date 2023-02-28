close all
clear
clc

n = 5; 
tol = 1e-6;
D = 0.05: 0.05: 0.95;
[~,m] = size(D);

rank = zeros(m,n+1);

Num_Iter = zeros(m,1);

Sec_Eig = zeros(m,1);

x = ones(n+1,1) ./ (n+1);
Err = ones(m,1) .* norm(x,2);


for i = 1:m
    % damping parameter
    d = D(i);
    
    % matrix A
    A = zeros(n+1,n+1);
    A(1,2:n+1) = 1 - d;
    A(2:n+1, 1) = 1 / n;
    A(3,2) = d/2; A(4,2) = d/2;
    A(2,3) = d;
    A(2,4) = d/2; A(5,4) = d/2;
    A(2,5) = d/2; A(4,5) = d/2;
    A(2,6) = d/2; A(4,6) = d/2;
    
    % eigenvalues
    e = eig(A);
    ee = sort(abs(e),'descend');
    sprintf('spectral radius: %f', ee(1))
    Sec_Eig(i) = ee(2);
    
    % power iteration
    while (Err(i) > tol)
        Num_Iter(i) = Num_Iter(i) + 1;
        xpre = x;
        x = A * x;
        Err(i) = norm(x - xpre,2);
    end
    rank(i,:) = x';
end

% plotting
set(0,'DefaultLineLineWidth',3);

blue = [0.0000    0.4470    0.7410];
red = [0.8500    0.3250    0.0980];
gold = [0.9290    0.6940    0.1250];
teal = [32 178 170]/255;
green= [134, 179, 0]/255;
purple = [153 102 255]/255;

color = {blue red gold green teal purple};
lineSpec = {'-o','-^','-s','-*','-+','-d'};

figure(1);
for i = 1:6
    plot(D,rank(:,i),lineSpec{i},'markersize',12,'Color',color{i});
    hold on;
end
grid on;
xlabel('damping parameter');
ylabel('PageRank');

set(gca,'FontSize',30);
l = legend('$w_0$: restart','$w_1$: BYU','$w_2$: BYUI','$w_3$: Cougars',...
    '$w_4$: Basketball','$w_5$: Wiki');
set(l,'Interpreter','latex')
set(l,'FontSize',30);
set(l,'FontName','Times New Roman');


figure(2);
subplot(1,2,1);
plot(D, Sec_Eig,lineSpec{1},'markersize',12,'Color',color{1});
grid on;
xlabel('damping parameter');
set(gca,'FontSize',30);
l = legend('second largest |eigenvalue|');
set(l,'FontSize',30);
set(l,'FontName','Times New Roman');

subplot(1,2,2);
plot(D, Num_Iter,lineSpec{2},'markersize',12,'Color',color{2});
grid on;
xlabel('damping parameter');
set(gca,'FontSize',30);
l = legend('number of iterations');
set(l,'FontSize',30);
set(l,'FontName','Times New Roman');
