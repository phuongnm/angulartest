// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pnm.web;

import com.pnm.service.api.ContactService;
import com.pnm.web.ContactController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

privileged aspect ContactController_Roo_Controller {
    
    declare @type: ContactController: @Controller;
    
    declare @type: ContactController: @RequestMapping("/contacts");
    
    public ContactService ContactController.contactService;
    
    @Autowired
    public ContactController.new(ContactService contactService) {
        this.contactService = contactService;
    }

}