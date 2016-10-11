package com.pnm.web;
import com.pnm.domain.Contact;
import com.pnm.service.api.ContactService;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.controller.annotations.responses.json.RooJSON;

@RooController(path = "/angular", entity = Contact.class, service = ContactService.class)
@RooJSON
public class Angular {
}
