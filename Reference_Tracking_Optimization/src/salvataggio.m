        G = 1/(s+1)^8;
        analized = struct;
        analized.systemTransferFunction = G;
        strSelection ='Multiple Equal Poles';
        analized.Controller.pid = K_pid;
        
        analized.Loop.pid = Loop_PID;
        analized.ClosedLoop.pid = ClosedLoop_PID;
        
        info = stepinfo(ClosedLoop_PID);
        analized.pid = ga_info_to_struct(IAE,control,info,'pid');
        analized.time = info.SettlingTime;
         analized.Controller.ipd.K1 = K1_ipd;
        analized.Controller.ipd.K2 = K2_ipd;
        
        analized.Loop.ipd = Loop_IPD;
        analized.ClosedLoop.ipd = ClosedLoop_IPD;
        info = stepinfo(ClosedLoop_IPD); 
        
        analized.ipd = ga_info_to_struct(IAE1,control1,info,'i_pd');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
         analized.Controller.dpi.K1 = K1_dpi;
        analized.Controller.dpi.K2 = K2_dpi;
        analized.Controller.dpi.K3 = K3_dpi;
        
        analized.Loop.dpi =(K1_dpi+K2_dpi)*(G/(1+(G*K3_dpi)));
        analized.ClosedLoop.dpi = ClosedLoop_DPI;
        
        info = stepinfo(ClosedLoop_DPI); 
        analized.dpi = ga_info_to_struct(IAE2,control2,info,'pi_d');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        analized.Controller.pida = K_pida;
        analized.Loop.pida = Loop_PIDA;
        
        analized.ClosedLoop.pida = ClosedLoop_PIDA;
        info = stepinfo(ClosedLoop_PIDA);     
        analized.pida = ga_info_to_struct(IAE3,control3,info,'pida');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end  
        
        print_excel(analized,strSelection,8);
        