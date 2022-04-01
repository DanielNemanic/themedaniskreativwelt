/**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 */
$(document).ready(function (){
    const $ = jQuery;
    const commentsList = $('#product-comments-list');
    const emptyProductComment = $('#empty-product-comment');
    const commentsListUrl = commentsList.data('list-comments-url');
    const updateCommentUsefulnessUrl = commentsList.data('update-comment-usefulness-url');
    const reportCommentUrl = commentsList.data('report-comment-url');
    const commentPrototype = commentsList.data('comment-item-prototype');

    emptyProductComment.hide();
    $('.grade-stars').rating();

    prestashop.on('updatedProduct', function() {
        $('.product-comments-additional-info .grade-stars').rating();
    })

    document.addEventListener('updateRating', function() {
        $('.grade-stars').rating();
    });

    const updateCommentPostErrorModal = $('#update-comment-usefulness-post-error');

    const confirmAbuseModal = $('#report-comment-confirmation');
    const reportCommentPostErrorModal = $('#report-comment-post-error');
    const reportCommentPostedModal = $('#report-comment-posted');

    function showUpdatePostCommentErrorModal(errorMessage) {
        $('#update-comment-usefulness-post-error-message').html(errorMessage);
        UIkit.modal(updateCommentPostErrorModal).show();
    }

    function showReportCommentErrorModal(errorMessage) {
        $('#report-comment-post-error-message').html(errorMessage);
        UIkit.modal(reportCommentPostErrorModal).show();
    }

    function paginateComments(page) {
        $.get(commentsListUrl, {page: page}, function(jsonResponse) {
            if (jsonResponse.comments && jsonResponse.comments.length > 0) {
                populateComments(jsonResponse.comments);
                if (jsonResponse.comments_nb > jsonResponse.comments_per_page) {
                    $('#product-comments-list-pagination').pagination({
                        currentPage: page,
                        items: jsonResponse.comments_nb,
                        itemsOnPage: jsonResponse.comments_per_page,
                        cssStyle: '',
                        prevText: '<span uk-icon="icon: chevron-left"></span>',
                        nextText: '<span uk-icon="icon: chevron-right"></span>',
                        useAnchors: false,
                        displayedPages: 2,
                        listStyle: 'uk-pagination',
                        onPageClick: paginateComments
                    });
                } else {
                    $('#product-comments-list-pagination').hide();
                }
            } else {
                commentsList.html('');
                emptyProductComment.show();
                commentsList.append(emptyProductComment);
            }
        });
    }

    function populateComments(comments) {
        commentsList.html('');
        comments.forEach(addComment);
    }

    function addComment(comment) {
        var commentTemplate = commentPrototype;
        var customerName = comment.customer_name;
        if (!customerName) {
            customerName = comment.firstname+' '+comment.lastname;
        }
        commentTemplate = commentTemplate.replace(/@COMMENT_ID@/, comment.id_product_comment);
        commentTemplate = commentTemplate.replace(/@PRODUCT_ID@/, comment.id_product);
        commentTemplate = commentTemplate.replace(/@CUSTOMER_NAME@/, customerName);
        commentTemplate = commentTemplate.replace(/@COMMENT_DATE@/, comment.date_add);
        commentTemplate = commentTemplate.replace(/@COMMENT_TITLE@/, comment.title);
        commentTemplate = commentTemplate.replace(/@COMMENT_COMMENT@/, comment.content);
        commentTemplate = commentTemplate.replace(/@COMMENT_USEFUL_ADVICES@/, comment.usefulness);
        commentTemplate = commentTemplate.replace(/@COMMENT_NOT_USEFUL_ADVICES@/, (comment.total_usefulness - comment.usefulness));
        commentTemplate = commentTemplate.replace(/@COMMENT_TOTAL_ADVICES@/, comment.total_usefulness);

        const $comment = $(commentTemplate);
        $('.grade-stars', $comment).rating({
            grade: comment.grade
        });
        $('.useful-review', $comment).click(function() {
            updateCommentUsefulness($comment, comment.id_product_comment, 1);
        });
        $('.not-useful-review', $comment).click(function() {
            updateCommentUsefulness($comment, comment.id_product_comment, 0);
        });
        $('.report-abuse', $comment).click(function() {
            confirmCommentAbuse(comment.id_product_comment);
        });

        commentsList.append($comment);
    }

    function updateCommentUsefulness($comment, commentId, usefulness) {
        $.post(updateCommentUsefulnessUrl, {id_product_comment: commentId, usefulness: usefulness}, function(jsonData){
            if (jsonData) {
                if (jsonData.success) {
                    $('.useful-review-value', $comment).html(jsonData.usefulness);
                    $('.not-useful-review-value', $comment).html(jsonData.total_usefulness - jsonData.usefulness);
                } else {
                    const decodedErrorMessage = $("<div/>").html(jsonData.error).text();
                    showUpdatePostCommentErrorModal(decodedErrorMessage);
                }
            } else {
                showUpdatePostCommentErrorModal(productCommentUpdatePostErrorMessage);
            }
        }).fail(function() {
            showUpdatePostCommentErrorModal(productCommentUpdatePostErrorMessage);
        });
    }

    function confirmCommentAbuse(commentId) {
        UIkit.modal(confirmAbuseModal).show();
        confirmAbuseModal.one('modal:confirm', function(event, confirm) {
            if (!confirm) {
                return;
            }
            $.post(reportCommentUrl, {id_product_comment: commentId}, function(jsonData){
                if (jsonData) {
                    if (jsonData.success) {
                        UIkit.modal(reportCommentPostedModal).show();
                    } else {
                        showReportCommentErrorModal(jsonData.error);
                    }
                } else {
                    showReportCommentErrorModal(productCommentAbuseReportErrorMessage);
                }
            }).fail(function() {
                showReportCommentErrorModal(productCommentAbuseReportErrorMessage);
            });
        })
    }

    paginateComments(1);
});