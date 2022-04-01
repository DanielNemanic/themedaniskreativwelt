/**
* Daniel Nemanic
* https://daniel-nemanic.de
* dn@daniel-nemanic.de
*/
$(document).ready(function () {
    $('.newsletter form').on('submit', function () {
        var psemailsubscriptionForm = $(this);
        if (typeof psemailsubscription_subscription === 'undefined') {
            return true;
        }
        if($(this).find('.uk-input').val() == ''){
            $(this).find('.uk-input').addClass( 'uk-form-danger' );
            return false;
        }
        $(this).find('.uk-input').removeClass( 'uk-form-danger' );
        $('.newsletter-alert').remove();
        $.ajax({
            type: 'POST',
            dataType: 'JSON',
            url: psemailsubscription_subscription,
            cache: false,
            data: $(this).serialize(),
            success: function (data) {
                if (data.nw_error) {
                    psemailsubscriptionForm.prepend('<p class="uk-alert-danger newsletter-alert " uk-alert><a class="uk-alert-close" uk-close></a>' + data.msg + '</p>');
                } else {
                    psemailsubscriptionForm.prepend('<p class="uk-alert-success newsletter-alert " uk-alert><a class="uk-alert-close" uk-close></a>' + data.msg + '</p>');
                    $(this).find('.uk-input').val('');
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
        return false;
    });
});
