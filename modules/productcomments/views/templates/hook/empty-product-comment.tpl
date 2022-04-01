{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $post_allowed && $nb_comments == 0}
    <article id="emptyProductComment" class="uk-comment uk-comment-primary">
        <div class="uk-comment-body">
            {if $post_allowed}
                <button class="uk-button uk-button-daniskreativwelt post-product-comment">
                    <span uk-icon="icon: pencil"></span>
                    {l s='Be the first to write your review' d='Modules.Productcomments.Shop'}
                </button>
            {else}
                {l s='No customer reviews for the moment.' d='Modules.Productcomments.Shop'}
            {/if}
        </div>
    </article>
{/if}