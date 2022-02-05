//
//  Copyright © 2022 CCT. All rights reserved.
//


final class FormSection {

    var key: String
    var header: FormHeader?
    var fields: [FormField]

    init(key: String, header: FormHeader? = nil, fields: [FormField]) {
        self.key = key
        self.header = header
        self.fields = fields
    }
}
