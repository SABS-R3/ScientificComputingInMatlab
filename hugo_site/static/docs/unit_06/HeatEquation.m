% Function that solves the 1d heat equation on [0,1] with zero Dirichlet
% boundary conditions and initial condition u_0=sin(pi*x).
%
% Inputs: N - Number of points to solve on.
% Outputs: MaxError - Maximum error of the numerical solution.
function MaxError = HeatEquation(N)
    %% You can't change this section %%
    nu = 0.2;                 % ratio of spatial to temporal step, chosen for stability
    dx = 1/N;                 % space step
    dt = nu*dx^2;             % time step (Chosen to ensure stability)
    x = (0:dx:1)';            % grid points to solve on
    ue = sin(pi*x);           % initial data
    MaxError = 0;
    EndTime = 0.2;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% You can change from here on in %%
    %
    u = ue(2:N); % remove boundary values from initial numerical solution (always 0)
    %
    figure; hold on;
    plot(x,[0;u;0],'b',x,ue,'r:'); drawnow; % plot initial solution
    %
    for t = dt:dt:EndTime
        clear A ue;
        %
        % Calculate A
        for i = 1:N-1
            for j = 1:N-1
                if i==j
                    A(i,j) = 1+2*nu;
                elseif abs(i-j)==1
                    A(i,j) = -nu;
                end
            end
        end
        %
        % update solution by solving Au^{t+1}= u^{t}
        InvA = inv(A);
        u = InvA*u;
        %
        for i = 1:N+1
            ue(i,1) = sin(pi*x(i))*exp(-pi*pi*t); % compute exact solution
        end
        if mod(t,0.05) < dt % at intervals of 0.05
            plot(x,[0;u;0],'b',x,ue,'r:'); drawnow; % plot current solution
        end
        MaxError = max([MaxError,max(u-ue(2:N))]); % Calculate the Error
    end
end
