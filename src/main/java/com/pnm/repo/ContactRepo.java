package com.pnm.repo;
import com.pnm.domain.Contact;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepository;

@RooJpaRepository(entity = Contact.class)
public interface ContactRepo {
}
