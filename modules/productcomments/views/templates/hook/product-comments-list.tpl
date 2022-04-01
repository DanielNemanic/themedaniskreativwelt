{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<script type="text/javascript">
  var productCommentUpdatePostErrorMessage = '{l|escape:'javascript' s='Sorry, your review appreciation cannot be sent.' d='Modules.Productcomments.Shop'}';
  var productCommentAbuseReportErrorMessage = '{l|escape:'javascript' s='Sorry, your abuse report cannot be sent.' d='Modules.Productcomments.Shop'}';
</script>

<div>
  <div class="uk-width-1-1  uk-margin" id="product-comments-list-header">
    <div class="comments-nb">
      <span uk-icon="icon:commenting"></span>
      {l s='Comments' d='Modules.Productcomments.Shop'} <span class="uk-badge">{$nb_comments}</span>
    </div>
    {include file='module:productcomments/views/templates/hook/average-grade-stars.tpl' grade=$average_grade}
  </div>

  <div class="uk-child-width-1-1 uk-child-width-1-2@s " id="product-comments-list-footer" uk-grid>
    {if $post_allowed && $nb_comments != 0}
      <div class="uk-margin">
        <button class="uk-button uk-button-daniskreativwelt post-product-comment uk-margin-remove">
          <span uk-icon="icon: pencil"></span>
          {l s='Write your review' d='Modules.Productcomments.Shop'}
        </button>
      </div>
    {/if}
    <div id="product-comments-list-pagination" class="uk-inline"></div>
  </div>

  {include file='module:productcomments/views/templates/hook/empty-product-comment.tpl'}
  {include file='module:productcomments/views/templates/hook/product-comment-item-prototype.tpl' assign="comment_prototype"}

  <div class="uk-width-1-1"
       id="product-comments-list"
       data-list-comments-url="{$list_comments_url nofilter}"
       data-update-comment-usefulness-url="{$update_comment_usefulness_url nofilter}"
       data-report-comment-url="{$report_comment_url nofilter}"
       data-comment-item-prototype="{$comment_prototype|escape:'html_attr'}">
    <div class="uk-text-center">
      <div uk-spinner="ratio:2;"></div>
    </div>
  </div>
</div>

{* Appreciation post error modal *}
{include file='module:productcomments/views/templates/hook/alert-modal.tpl'
  modal_id='update-comment-usefulness-post-error'
  modal_title={l s='Your review appreciation cannot be sent' d='Modules.Productcomments.Shop'}
  icon='warning'
}

{* Confirm report modal *}
{include file='module:productcomments/views/templates/hook/confirm-modal.tpl'
  modal_id='report-comment-confirmation'
  modal_title={l s='Report comment' d='Modules.Productcomments.Shop'}
  modal_message={l s='Are you sure that you want to report this comment?' d='Modules.Productcomments.Shop'}
  icon='commenting'
}

{* Report comment posted modal *}
{include file='module:productcomments/views/templates/hook/alert-modal.tpl'
  modal_id='report-comment-posted'
  modal_title={l s='Report sent' d='Modules.Productcomments.Shop'}
  modal_message={l s='Your report has been submitted and will be considered by a moderator.' d='Modules.Productcomments.Shop'}
}

{* Report abuse error modal *}
{include file='module:productcomments/views/templates/hook/alert-modal.tpl'
modal_id='report-comment-post-error'
modal_title={l s='Your report cannot be sent' d='Modules.Productcomments.Shop'}
icon='warning'
}
