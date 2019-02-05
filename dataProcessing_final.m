
user_num = [9  10 11 12 13 14 16 17 18 19 21 22 23 24 25 26 27 28 29 30 31 32 33 34 36 37 38 39 40 41];
EMG_forkdata = [];

IMU_forkdata = [];

for i = 1:30
    [emg, img] = data_process(user_num(i));
    EMG_forkdata = [ EMG_forkdata ; emg];
   
    IMU_forkdata = [IMU_forkdata ; img];
    

end

function [EMG_processed_data, IMU_processed_data] = data_process(user_num)
filepath = strcat('groundTruth/user',num2str(user),'/fork');
txtfile = fullfile(path_fork, '*.txt');
fork_file = dir(txtfile);
ground_truth_data = csvread([fork_file.folder,'/',fork_file.name]);

filepath = strcat('MyoData/user',num2str(user),'/fork');
txtfile_EMG = fullfile(filepath, '*EMG.txt');
txtfile_IMU = fullfile(filepath, '*IMU.txt');
EMG_file_dir = dir(txtfile_EMG);
IMU_file_dir = dir(txtfile_IMU);
EMG_data = csvread([EMG_file.folder,'/',EMG_file.name]);
IMU_data = csvread([IMU_file.folder,'/',IMU_file.name]);

EMG_processed_data = [zeros(size(EMG_data,1),1) EMG_data zeros(size(EMG_data,1),1)];
IMU_processed_data = [zeros(size(IMU_data,1),1) IMU_data zeros(size(IMU_data,1),1)];
EMG_processed_data(:,1) = user;
IMU_processed_data(:,1) = user;

frame = ground_truth_data(1,1);
EMG_time_stamp = EMG_data(1,1) ;

IMU_time_stamp = IMU_data(1,1);



for i= 1:length(ground_truth_data)
    start_time_EMG = compute_time(ground_truth_data(i,1),frame,first_EMG_time_stamp);
    end_time_EMG = compute_time(ground_truth_data(i,2),frame,first_EMG_time_stamp);
    start_time_IMU = compute_time(ground_truth_data(i,1),frame,first_IMU_time_stamp);
    end_time_IMU = compute_time(ground_truth_data(i,2),frame,first_IMU_time_stamp);
    j=1;
    while (j<= length(EMG_data) ) 
        if (EMG_data(j,1) >= start_time_EMG ) && (EMG_data(j,1) <= end_time_EMG )
        EMG_processed_data(j,end) = 1;
        end
        j= j +1;
    end
    
    
    j=1;
    while (j<= length(IMU_data) ) 
        if (IMU_data(j,1) >= start_time_IMU ) && (IMU_data(j,1) <= end_time_IMU )
        IMU_processed_data(j,end) = 1;
        end
        j= j +1;
    end   
end

end

function [last_time] = compute_time(frame_number , first_frame , first_time )
    last_time = (((frame_number - first_frame)/30)*1000) + first_time;
end
