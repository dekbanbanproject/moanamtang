<?php
    include('confighos.php');
        
    header("Access-Control-Allow-Origin: *");
    // $conn = mysqli_connect('27.254.191.157', 'gotowin', 'Fdm^;bog-91','gtw'); 

    if (!$conn) {
        echo "Error: Unable to connect to MySQL." . PHP_EOL;
        echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
        echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;		
        exit;
    }
    if (!$conn->set_charset("utf8")) {
        printf("Error loading character set utf8: %s\n", $conn->error);
        exit();
    }
    if(isset($_GET)){
        if ($_GET['isAdd'] == 'true') {
            $date    = date('Y-m-d');
            $y       = date('Y') + 543;
            $m       = date('m');
            $newweek = date('Y-m-d', strtotime($date . ' -1 week')); //ย้อนหลัง 1 สัปดาห์
            $newDate = date('Y-m-d', strtotime($date . ' -1 months')); //ย้อนหลัง 1 เดือน
            $newyear = date('Y-m-d', strtotime($date . ' -1 year')); //ย้อนหลัง 1 ปี 
   
            $vn     = $_GET['vn'];
            
            $result = mysqli_query($conn,
            "SELECT o.vstdate,p.cid,oq.seq_id,o.hn,o.vsttime,o.vn,v.hospmain,concat(p.pname,p.fname,' ',p.lname) as ptname,t.name as pttype_name ,o.pttype,o.pttypeno,v.pdx,i.name as pdx_name  ,v.income,oc.cc,v.main_pdx
                    ,s.name as spclty_name,oq.dx_text_list,sti.name as ovstist_name ,k.department as department_name
                    ,st.name as ost_name ,oo1.data_ok,oo1.send_done,oo1.reply_error,oo1.nhso_error_code,oq.promote_visit,hd.name as hospital_department_name ,k2.department as register_department_name,oq.doctor_list_text
                    ,kk3.department as main_department_name 
                    ,o.finance_lock,  ssp.sub_spclty_name,pw.name as pt_walk_name,o.oqueue,vt.visit_type_name ,v.age_y,v.age_m,v.age_d,i3.an,ou.name as staff_name,o.pt_priority, p3.name as pt_priority_name ,oq.pttype_check_status_id,pcs.pttype_check_status_name,ou1.name as pttype_check_staff_name,oq.edc_approve_list_text  ,pf.patient_file_status_id ,k3.department as last_file_department ,oq.rx_ok,oq.finance_status_flag,oq.has_arrear, ps1.name as pt_subtype_name , oe.upload_status_code as eclaim_status_code,oe.upload_datetime as eclaim_datetime,oe.moph_finance_upload_status, (v.count_in_day+1) as count_in_day,(v.count_in_month+1) as count_in_month,(v.count_in_year+1) as count_in_year,v.rcpt_money,v.paid_money,vpt.auth_code,oq.nhso_fee_schedule_list_text
                    ,oc.bps,oc.bpd,oc.temperature,oc.bw,oc.bmi 
                    FROM ovst o  
                    left outer join vn_stat v on v.vn = o.vn  
                    left outer join opdscreen oc  on oc.vn = o.vn  
                    left outer join patient p  on p.hn = o.hn  
                    left outer join pttype t on t.pttype = o.pttype  
                    left outer join icd101 i on i.code = v.main_pdx  
                    left outer join spclty s on s.spclty = o.spclty  
                    left outer join ovstist sti on sti.ovstist = o.ovstist  
                    left outer join ovstost st on st.ovstost = o.ovstost  
                    left outer join ovst_seq oq on oq.vn = o.vn  
                    left outer join opduser ou1 on ou1.loginname = oq.pttype_check_staff  
                    left outer join ovst_nhso_send oo1 on oo1.vn = o.vn  
                    left outer join kskdepartment k on k.depcode = o.cur_dep  
                    left outer join kskdepartment k2 on k2.depcode = oq.register_depcode  
                    left outer join kskdepartment kk3 on kk3.depcode = o.main_dep  
                    left outer join hospital_department hd on hd.id = oq.hospital_department_id  
                    left outer join sub_spclty ssp on ssp.sub_spclty_id = oq.sub_spclty_id  
                    left outer join pt_walk pw on pw.walk_id = oc.walk_id  
                    left outer join patient_opd_file pf on pf.hn = o.hn  
                    left outer join kskdepartment k3 on k3.depcode = pf.last_depcode  
                    left outer join visit_type vt on vt.visit_type = o.visit_type  
                    left outer join ipt i3  on i3.vn = o.vn  
                    left outer join opduser ou on ou.loginname = o.staff  
                    left outer join pt_priority p3 on p3.id = o.pt_priority  
                    left outer join pt_subtype ps1 on ps1.pt_subtype = o.pt_subtype  
                    left outer join pttype_check_status pcs on pcs.pttype_check_status_id = oq.pttype_check_status_id  
                    left outer join ovst_eclaim oe on oe.vn = o.vn  
                    left outer join visit_pttype vpt on vpt.vn = o.vn and vpt.pttype = o.pttype  
                    WHERE o.vn ='$vn'  
                    GROUP BY o.vn 
            ");

           
            if ($result) {
                while($row=mysqli_fetch_assoc($result)){
                    $output[]=$row;
                }
                echo json_encode($output);
            }
            
        } else echo "Wellcome";
    }

		
    

