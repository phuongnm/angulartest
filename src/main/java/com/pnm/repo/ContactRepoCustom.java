package com.pnm.repo;
import com.pnm.domain.Contact;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustom;

@RooJpaRepositoryCustom(entity = Contact.class, defaultSearchResult = Contact.class)
public interface ContactRepoCustom {
}
