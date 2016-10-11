// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pnm.service.api;

import com.pnm.domain.Contact;
import com.pnm.repo.GlobalSearch;
import com.pnm.service.api.ContactService;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContactService_Roo_Service {
    
    @Transactional(readOnly = false)
    public abstract Contact ContactService.save(Contact entity);    
    @Transactional(readOnly = false)
    public abstract void ContactService.delete(Long id);    
    @Transactional(readOnly = false)
    public abstract List<Contact> ContactService.save(Iterable<Contact> entities);    
    @Transactional(readOnly = false)
    public abstract void ContactService.delete(Iterable<Long> ids);    
    public abstract List<Contact> ContactService.findAll();    
    public abstract List<Contact> ContactService.findAll(Iterable<Long> ids);    
    public abstract Contact ContactService.findOne(Long id);    
    public abstract long ContactService.count();    
    public abstract Page<Contact> ContactService.findAll(GlobalSearch globalSearch, Pageable pageable);    
}