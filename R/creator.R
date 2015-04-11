exposeClass("Symbol",
            constructors = list("", c("String")),
            fields = c("val"),
            methods = "toC",
            header = '#include "Symbol.h"',
            readOnly = c("val")
            )