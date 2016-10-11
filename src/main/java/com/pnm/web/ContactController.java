package com.pnm.web;
import com.pnm.domain.Contact;
import com.pnm.service.api.ContactService;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

@RooController(path = "/contacts", entity = Contact.class, service = ContactService.class)
@RooThymeleaf
public class ContactController {
}
