package cmdobj_list_limit

import com.olavgg.UpdateTagCmd

class TagController {

    def index() {
        Tag tag = Tag.get(1)
        if(tag){
            tag.metaClass.templateKeys = TagKeys.findAllByTag(tag)
            println("total keys: ${tag.templateKeys.size}")
            return [form: tag]
        }
        else {
            render text: 'not found'
        }
    }

    def saveTag(UpdateTagCmd form){
        render text: "total keys: ${form.templateKeys.size()}"
    }
}
