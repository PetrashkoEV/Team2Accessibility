


function isVisibleElement(el) {
    return el.css('visibility') === 'visible';
};

function checkAccessibilityValidation() {

    var emails = $('input[type="email"], input[type="password"]');
    emails.each(function () {
        var $input = $(this);

        // Reset aria-invalid attr.
        $input.attr('aria-invalid', 'false');

        var describedby = $input.attr('aria-describedby') ? $input.attr('aria-describedby') : '';

        var errorDescriptions = $input.parent().find('span');

        errorDescriptions.each(function (i) {

            var $errorMessage = $(this);

            // Check elements with visibility: visible and display:none.
            if (isVisibleElement($errorMessage) && $errorMessage.is(":visible")) {

                if (describedby.indexOf(errorDescriptions[i].id) === -1) {

                    // First write error then the description field.
                    var ariaDescribedby = errorDescriptions[i].id + ' ' + describedby;
                    // Save new value.
                    describedby = ariaDescribedby;

                    $input.attr({ 'aria-describedby': describedby });
                }

                $input.attr('aria-invalid', 'true');
                $errorMessage.attr('aria-hidden', 'false');

            } else {
                var newDescribedby = describedby.replace(errorDescriptions[i].id + ' ', '');

                $input.attr('aria-describedby', newDescribedby);
                $errorMessage.attr('aria-hidden', 'true');
            }

        });
    });
}

function putErrorsToAtomicContainer() {
    $('#roleAtomicErrors').text($('div[aria-atomic="true"] ul li').text());
    $('#roleAtomicErrors').attr('role', 'alert');
}