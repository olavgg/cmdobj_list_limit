package com.olavgg

import cmdobj_list_limit.Tag
import grails.compiler.GrailsCompileStatic
import grails.validation.Validateable

@GrailsCompileStatic
class UpdateTagCmd implements Validateable{

    Tag tag
    String name

    Set<TemplateKeyCmd> templateKeys

    static constraints = {
        tag nullable: false
        name nullable: false

    }

}

@GrailsCompileStatic
class TemplateKeyCmd implements Validateable{

    Long id
    String text

}
