package cmdobj_list_limit

class BootStrap {

    def init = { servletContext ->

        Tag.withTransaction {
            Tag tag = new Tag(name: 'example')
            if(tag.save()){
                new File("tagkeys.csv").eachLine { field ->
                    TagKeys tagKey = new TagKeys(
                            tag: tag,
                            text: field
                    )
                    if(tagKey.save()){
                        println "saved key: ${tagKey.id}"
                    } else {
                        tagKey.errors.allErrors.each { println it }
                    }
                }
            }
        }

    }
    def destroy = {
    }
}
