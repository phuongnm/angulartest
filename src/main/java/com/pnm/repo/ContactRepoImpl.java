package com.pnm.repo;

import org.springframework.data.jpa.repository.support.QueryDslRepositorySupport;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import com.pnm.domain.Contact;
import com.pnm.domain.QContact;
import com.mysema.query.jpa.JPQLQuery;

@RooJpaRepositoryCustomImpl(repository = ContactRepoCustom.class)
public class ContactRepoImpl extends QueryDslRepositorySupport{

    ContactRepoImpl() {
        super(Contact.class);
    }
    
    private JPQLQuery getQueryFrom(QContact qEntity){
        return from(qEntity);
    }
}