/**
* Daniel Nemanic
* https://daniel-nemanic.de
* dn@daniel-nemanic.de
*/
function  addNotification() {
    var ids = $('div.js-mailalert > input[type=hidden]');

    $.ajax({
        type: 'POST',
        url: $('div.js-mailalert').data('url'),
        data: 'id_product='+ids[0].value+'&id_product_attribute='+ids[1].value+'&customer_email='+$('div.js-mailalert > input[type=email]').val(),
        success: function (resp) {
            resp = JSON.parse(resp);

            $('div.js-mailalert > span').html('<article class="uk-alert-success" uk-alert>'+resp.message+'</article>').show();
            if (!resp.error) {
                $('div.js-mailalert > button').hide();
                $('div.js-mailalert > input[type=email]').hide();
                $('div.js-mailalert > #gdpr_consent').hide();
            }
        }
    });
    return false;
}

$('document').ready(function()
{
    $('.js-remove-email-alert').click(function()
    {
        var self = $(this);
        var ids = self.attr('rel').replace('js-id-emailalerts-', '');
        ids = ids.split('-');
        var id_product_mail_alert = ids[0];
        var id_product_attribute_mail_alert = ids[1];
        var parent = self.closest('li');

        $.ajax({
            url: self.data('url'),
            type: "POST",
            data: {
                'id_product': id_product_mail_alert,
                'id_product_attribute': id_product_attribute_mail_alert
            },
            success: function(result)
            {
                if (result == '0')
                {
                    parent.fadeOut("normal", function()
                    {
                        parent.remove();
                    });
                }
            }
        });
    });
});
