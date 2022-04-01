{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $nb_comments != 0 || $post_allowed}
  <div class="productCommentsAdditionalInfo uk-width-1-1 uk-width-1-2@s">
      {include file='module:productcomments/views/templates/hook/average-grade-stars.tpl' grade=$average_grade}
    <div class="additional-links uk-inline">
      <a class="link-comment" href="#displayCommentsProducts" uk-tooltip="{l s='Read user reviews' d='Modules.Productcomments.Shop'}" uk-scroll="offset:100;">
        <span uk-icon="icon: commenting"></span>
        <span class="uk-badge" >{$nb_comments}</span>
      </a>
      {if $post_allowed}
        <a class="link-comment post-product-comment" href="#product-comments-list-header" uk-tooltip="{l s='Write your review' d='Modules.Productcomments.Shop'}">
          <span uk-icon="icon: pencil"></span>
        </a>
      {/if}
    </div>
      {* Rich snippet rating*}
    <div itemprop="aggregateRating" itemtype="http://schema.org/AggregateRating" itemscope>
      <meta itemprop="reviewCount" content="{$nb_comments}" />
      <meta itemprop="ratingValue" content="{$average_grade}" />
    </div>
  </div>
{/if}
