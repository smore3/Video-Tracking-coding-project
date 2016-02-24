% function [] = vtrack()
%vtrack.m : Implemention PSO algorithm to track a object in an image frame
%sequence
%Terminology:   xrng    -   maximum x co-ordinate for image frame
%               yrng    -   maximum y co-ordinate for image frame
%               (X,Y)   -   co-ordinates of a point on the object 
%               vmax    -   maximum velocity or distance between centroid in two
%                           consecutive frames
%               kmax    -   maximum number of iterations
%               swarmx  -   x co-ordinates of the swarm
%               swarmy  -   y co-ordinates of the swarm
%               Pbest   -   Personal best
%               Gbest   -   Global best


%The inputs for this code are co-ordinates (X,Y) that lie on the object 
% in the starting frame considered for given video

clc,clear all,close all;
disp('START');
disp('Initializing..');
[FILENAME, PATHNAME, FILTERINDEX] = uigetfile('.avi','select video');
% selecting the input video 
vid=mmreader(FILENAME);
% reading the video

%% for flagjet.avi
% X = 183;
% Y = 107; %point that lies on the jet in frame 1

frmidx = 1;

numFrms = get(vid, 'numberOfFrames'); %To get total number of frames. 
                                      
im = read(vid, frmidx);               % reading starting frame index

imshow(im);                           % Display the frame
display('Select the object location');
[X Y] = ginput(1);                    % Read and store pixel (X, Y), a point on target
display(['The object location (', num2str(X), ', ', num2str(Y), ') selected.'])
p = impixel(im ,X, Y);                % Getting RGB vaues of point on object
Ro = p(1);
Go = p(2);
Bo = p(3);

s=size(im);
xrng=s(2);                            % number of columns
yrng=s(1);                            % number of rows

imshow(im),hold on;                   % display first frame

PSOinit();                            % Initialise PSO parameters 

swarmpos_init();                      % Spreading the Swarm around (X,Y)

frmn=1;

disp(['frame ', num2str(frmidx), ': (', num2str(gbestx), ' ', num2str(gbesty),') Gbest value: ', num2str(gbest)])            
tpbest =[ pbest pbestx pbesty  vx  vy swarmx swarmy]  ;                      

plot(X, Y,'g*', swarmx, swarmy,'r.');  % plot(X,Y) on first frame

saveas(gcf,['e:\images\img_' num2str(frmn) '.jpg']);
                                      % save the first frame
                                    
frmidx=frmidx+1;                      % Consider next image frame
while(frmidx<=1007)                
    im = read(vid, frmidx);           % read next frame 
    frm_init();                       % reinitialize pbest and gbest
    for k=1:kmax
        gbestxt=gbestx;               % temporarily store current (gbestx,gbesty)
        gbestyt=gbesty;               
        
        for vmax=5:50:max(xrng,yrng)  % increase the swarm spread(vmax) till object 
                                      % is found when occlusion occurs
        cal_ff();                     % calculate fitness function
        updatePG();                   % update pbest and gbest
       
          if gbest<FFth                % compare gbest with FFth
             vel_update();            % update velocity of particles in swarm   
             
             pos_update();            % update position of particles in swarm
             break;
          else
             X=gbestxt;               % change (X,Y) to previous correct gbest
             Y=gbestyt;
             swarmpos_init();         % spread swarm around new (X,Y)
             disp(['frame ', num2str(frmidx), ': (', num2str(gbestx), ' ', num2str(gbesty),') Gbest value: ', num2str(gbest)]);
             disp(['iteration: ' num2str(k) ' vmax = ' num2str(vmax)]);
             tpbest = [ pbest pbestx pbesty  vx  vy swarmx swarmy]; 

             imshow(im),hold on;       
                                      % display image frame
             plot(swarmx,swarmy,'r.',gbestx,gbesty,'g*');
                                      % plot swarm positions on image frame
             saveas(gcf,['e:\images\img_' num2str(frmn) '_' num2str(k) '_' num2str(vmax) '.jpg']);
                                      % save the image frame with swarm spread on it
             hold off;
            
           end;
           
        end; 
        disp(['frame ', num2str(frmidx), ': (', num2str(gbestx), ' ', num2str(gbesty),') Gbest value: ', num2str(gbest)]);
        disp(['iteration: ' num2str(k) ' vmax = ' num2str(vmax)]);
        tpbest =[pbest pbestx pbesty  vx  vy swarmx swarmy];                   
       
        imshow(im),hold on;       
                                      % display image frame
        plot(swarmx,swarmy,'r.',gbestx,gbesty,'g*');
                                      % plot swarm positions on image frame
        saveas(gcf,['e:\images\img_' num2str(frmn) '_' num2str(k) '_' num2str(vmax) '.jpg']);
        hold off;
              
     
    end;
      
        
    disp(['frame ', num2str(frmidx), ':(', num2str(gbestx), ' ', num2str(gbesty),') Gbest value: ', num2str(gbest)])
    frmidx = frmidx + 1;
    frmn = frmn + 1;
    imshow(im),hold on;
    plot(swarmx,swarmy,'ro',gbestx,gbesty,'g*');
    saveas(gcf,['e:\images\img_' num2str(frmn) '.jpg']);
    hold off;
    tpbest =[pbest pbestx pbesty  vx  vy swarmx swarmy];

    
end

create_vid();                      %creating video from saved images
