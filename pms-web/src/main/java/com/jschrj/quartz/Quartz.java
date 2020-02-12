package com.jschrj.quartz;

import com.jschrj.api.system.SystemService;
import com.jschrj.common.EmailHelper;
import com.jschrj.pojo.system.Email;

import javax.annotation.Resource;
import java.util.List;

public class Quartz {

    @Resource
    SystemService systemService;

    public void sendMail() throws Exception {

        List<Email> emailList=systemService.getEmailList();
        for(int i=0;i<emailList.size();i++){
            EmailHelper emailHelper=new EmailHelper();
            emailHelper.sendMail(emailList.get(i).getMailtoname(),emailList.get(i).getContent());
            Email email=new Email();
            email.setId(emailList.get(i).getId());
            email.setStatus(1);
            systemService.updateEmail(email);
        }
    }
}
