// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pnm.repo;

import com.mysema.query.BooleanBuilder;
import com.mysema.query.jpa.JPQLQuery;
import com.mysema.query.types.Order;
import com.mysema.query.types.OrderSpecifier;
import com.mysema.query.types.path.NumberPath;
import com.pnm.domain.Contact;
import com.pnm.domain.QContact;
import com.pnm.repo.ContactRepoCustom;
import com.pnm.repo.ContactRepoImpl;
import com.pnm.repo.GlobalSearch;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContactRepoImpl_Roo_Jpa_Repository_Impl {
    
    declare parents: ContactRepoImpl implements ContactRepoCustom;
    
    declare @type: ContactRepoImpl: @Transactional(readOnly = true);
    
    public Page<Contact> ContactRepoImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        NumberPath<Long> idContact = new NumberPath<Long>(Long.class, "id");
        QContact contact = QContact.contact;
        JPQLQuery query = getQueryFrom(contact);
        BooleanBuilder where = new BooleanBuilder();

        if (globalSearch != null) {
            String txt = globalSearch.getText();
            where.and(
                contact.userName.containsIgnoreCase(txt)
                .or(contact.phoneNumber.containsIgnoreCase(txt))
            );

        }
        query.where(where);

        long totalFound = query.count();
        if (pageable != null) {
            if (pageable.getSort() != null) {
                for (Sort.Order order : pageable.getSort()) {
                    Order direction = order.isAscending() ? Order.ASC : Order.DESC;

                    switch(order.getProperty()){
                        case "userName":
                           query.orderBy(new OrderSpecifier<String>(direction, contact.userName));
                           break;
                        case "phoneNumber":
                           query.orderBy(new OrderSpecifier<String>(direction, contact.phoneNumber));
                           break;
                    }
                }
            }
            query.offset(pageable.getOffset()).limit(pageable.getPageSize());
        }
        query.orderBy(idContact.asc());
        
        List<Contact> results = query.list(contact);
        return new PageImpl<Contact>(results, pageable, totalFound);
    }
    
}
