// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pnm.repo;

import com.pnm.domain.Contact;
import com.pnm.repo.ContactRepoCustom;
import com.pnm.repo.GlobalSearch;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

privileged aspect ContactRepoCustom_Roo_Jpa_Repository_Custom {
    
    public abstract Page<Contact> ContactRepoCustom.findAll(GlobalSearch globalSearch, Pageable pageable);    
}
