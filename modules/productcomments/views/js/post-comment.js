/**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 */
$(document).ready(function (){
    const postCommentModal = $('#post-product-comment-modal');
    const commentPostedModal = $('#product-comment-posted-modal');
    const commentPostErrorModal = $('#product-comment-post-error');

    $('#post-product-comment-modal .grade-stars').rating();

    function showPostCommentModal() {
        UIkit.modal(commentPostedModal).hide();
        UIkit.modal(commentPostErrorModal).hide();
        UIkit.modal(postCommentModal).show();
    }
    function showPostErrorModal(errorMessage) {
        UIkit.modal(postCommentModal).hide();
        UIkit.modal(commentPostedModal).hide();
        clearPostCommentForm();
        $('#product-comment-post-error-message').html(errorMessage);
        UIkit.modal(commentPostErrorModal).show();
    }
    function showCommentPostedModal() {
        UIkit.modal(postCommentModal).hide();
        UIkit.modal(commentPostErrorModal).hide();
        clearPostCommentForm();
        UIkit.modal(commentPostedModal).show();
    }
    function clearPostCommentForm() {
        $('#post-product-comment-form input[type="text"]').val('');
        $('#post-product-comment-form input[type="text"]').removeClass('uk-form-danger');
        $('#post-product-comment-form input[type="text"]').removeClass('uk-form-success');
        $('#post-product-comment-form textarea').val('');
        $('#post-product-comment-form textarea').removeClass('uk-form-danger');
        $('#post-product-comment-form textarea').removeClass('uk-form-success');
        $('#post-product-comment-form .criterion-rating input').val(4).change();
    }
    function validateFormData(formData) {
        var isValid = true;
        formData.forEach(function(formField) {
            const fieldSelector = '#post-product-comment-form [name="'+formField.name+'"]';
            if (!formField.value) {
                $(fieldSelector).addClass('uk-form-danger');
                $(fieldSelector).removeClass('uk-form-success');
                isValid = false;
            } else {
                $(fieldSelector).removeClass('uk-form-danger');
                $(fieldSelector).addClass('uk-form-success');
            }
        });

        return isValid;
    }

    UIkit.util.on(postCommentModal,'hide', function (){
        UIkit.modal(postCommentModal).hide();
        clearPostCommentForm();
    });
    $(document).on('click', '.post-product-comment', function(event){
        event.preventDefault();
        showPostCommentModal();
    });
    $(document).on('submit', '#post-product-comment-form', function (event){
        event.preventDefault();
        var url = $(this).attr('action');
        var data = $(this).serialize();
        if (!validateFormData($(this).serializeArray())) {
            return;
        }
        $(this).replaceWith('<div class="uk-text-center"><div uk-spinner="ratio:2;"></div></div>');
        $.ajax({
            type: 'POST',
            url: url,
            cache: false,
            data: data,
        }).done(function(ajax){
            if (ajax) {
                if (ajax.success) {
                    clearPostCommentForm();
                    showCommentPostedModal();
                    window.location.reload();
                } else {
                    if (ajax.errors) {
                        var errorList = '<ul class="uk-list">';
                        for (var i = 0; i < ajax.errors.length; ++i) {
                            errorList += '<li>' + ajax.errors[i] + '</li>';
                        }
                        errorList += '</ul>';
                        showPostErrorModal(errorList);
                    } else {
                        const decodedErrorMessage = $("<div/>").html(ajax.error).text();
                        showPostErrorModal(decodedErrorMessage);
                    }
                }
            } else {
                showPostErrorModal(productCommentPostErrorMessage);
            }
        }).fail(function(ajax){
            showPostErrorModal(productCommentPostErrorMessage);
        });
        return false;
    });
});