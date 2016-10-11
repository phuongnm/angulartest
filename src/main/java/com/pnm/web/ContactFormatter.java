package com.pnm.web;
import com.pnm.domain.Contact;
import com.pnm.service.api.ContactService;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.formatters.RooFormatter;

@RooFormatter(entity = Contact.class, service = ContactService.class)
public class ContactFormatter {
}
