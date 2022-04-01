{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<article class="uk-comment uk-comment-primary uk-margin-small" data-product-comment-id="@COMMENT_ID@" data-product-id="@PRODUCT_ID@">
  <div class="uk-comment-header">
    <div class="uk-grid-medium uk-flex-middle" uk-grid>
      <div class="uk-width-expand">
        <h4 class="uk-comment-title uk-margin-remove">@COMMENT_TITLE@</h4>
        <ul class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top uk-float-left">
          <li>{l s='By %1$s' sprintf=['@CUSTOMER_NAME@'] d='Modules.Productcomments.Shop'}</li>
          <li>@COMMENT_DATE@</li>
          <li><div class="grade-stars"></div></li>
        </ul>
        <div class="uk-button-group uk-float-right">
          {if $usefulness_enabled}
            <a class="useful-review">
              <i class="material-icons thumb_up">thumb_up</i>
              <span class="useful-review-value">@COMMENT_USEFUL_ADVICES@</span>
            </a>
            <a class="not-useful-review">
              <i class="material-icons thumb_down">thumb_down</i>
              <span class="not-useful-review-value">@COMMENT_NOT_USEFUL_ADVICES@</span>
            </a>
          {/if}
          <a class="report-abuse" title="{l s='Report abuse' d='Modules.Productcomments.Shop'}">
            <i class="material-icons outlined_flag">flag</i>
          </a>
        </div>
      </div>
    </div>
  </div>
  <div class="uk-comment-body">
    <p>@COMMENT_COMMENT@</p>
  </div>
</article>

