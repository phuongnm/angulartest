// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pnm.web;

import com.pnm.domain.Contact;
import com.pnm.repo.GlobalSearch;
import com.pnm.web.Angular;
import java.lang.SuppressWarnings;
import java.net.URI;
import java.util.Collection;
import java.util.List;
import javax.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

privileged aspect Angular_Roo_JSON {
    
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Page<Contact> Angular.list(GlobalSearch search, Pageable pageable) {
        
        Page<Contact> contacts = contactService.findAll(search, pageable);
        return contacts;
    }
    
    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public ResponseEntity Angular.create(@Valid @RequestBody Contact contact, BindingResult result) {
        
        if (contact.getId() != null) {
            return new ResponseEntity(HttpStatus.CONFLICT);
        }
        
        if (result.hasErrors()) {
            return new ResponseEntity(result, HttpStatus.CONFLICT);
        }
        
        Contact newContact = contactService.save(contact);
        HttpHeaders responseHeaders = populateHeaders(newContact.getId());
        
        return new ResponseEntity(newContact, responseHeaders, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{contact}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public ResponseEntity Angular.update(@Valid @RequestBody Contact contact, BindingResult result) {
        
        if (result.hasErrors()) {
            return new ResponseEntity(result, HttpStatus.CONFLICT);
        }
        
        Contact savedContact = contactService.save(contact);
        
        return new ResponseEntity(savedContact, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    @SuppressWarnings({ "rawtypes" })
    public ResponseEntity Angular.delete(@PathVariable("id") Long id) {
        
        contactService.delete(id);
        
        return new ResponseEntity(HttpStatus.OK);
    }
    
    @RequestMapping(value = "/batch", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public ResponseEntity Angular.createBatch(@Valid @RequestBody Collection<Contact> contacts, BindingResult result) {
        
        if (result.hasErrors()) {
            return new ResponseEntity(result, HttpStatus.CONFLICT);
        }
        
        List<Contact> newContacts = contactService.save(contacts);
        
        return new ResponseEntity(newContacts, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/batch", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public ResponseEntity Angular.updateBatch(@Valid @RequestBody Collection<Contact> contacts, BindingResult result) {
        
        if (result.hasErrors()) {
            return new ResponseEntity(result, HttpStatus.CONFLICT);
        }
        
        List<Contact> savedContacts = contactService.save(contacts);
        
        return new ResponseEntity(savedContacts, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/batch/{ids}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    @SuppressWarnings({ "rawtypes" })
    public ResponseEntity Angular.deleteBatch(@PathVariable("ids") Collection<Long> ids) {
        
        contactService.delete(ids);
        
        return new ResponseEntity(HttpStatus.OK);
    }
    
    public HttpHeaders Angular.populateHeaders(Long id) {
        UriComponents uriComponents = UriComponentsBuilder.fromUriString("/contacts/{id}").build();
        URI uri = uriComponents.expand(id).encode().toUri();
        
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.setLocation(uri);
        return responseHeaders;
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public ResponseEntity Angular.show(@PathVariable("id") Long id) {
        
        Contact contact = contactService.findOne(id);
        
        if (contact == null) {
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity(contact, HttpStatus.FOUND);
    }
    
}
