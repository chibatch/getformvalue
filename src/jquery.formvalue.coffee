$ = jQuery

$.fn.getFormValue = () ->

    inputs = $(this).find ':input'

    data = {}
    inputs.each ->
        tag  = this.tagName.toLowerCase()
        name = this.name

        if tag is 'input'
            type = $(this).attr 'type'

            if type is 'radio'
                if $(this).is ':checked'
                    value = $(this).val()
            else if type is 'checkbox'
                selector = 'input[name="' + name + '"]'

                count = $(selector).size()

                if count is 1
                    if $(this).is ':checked'
                        value = $(this).val()
                else if count > 1
                    values = []
                    $(selector + ':checked').each ->
                        values.push $(this).val()

                    if values.length > 1
                        value = values
            else if type is 'number'
                value = Number $(this).val()

            else
                value = $(this).val()

        else
            value = $(this).val()

        if value and name
            data[name] = value

    data