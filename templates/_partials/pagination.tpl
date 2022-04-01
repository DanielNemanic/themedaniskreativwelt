{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-margin-medium-top " uk-grid>
    <div class="uk-width-2-3">
        {block name='pagination_page_list'}
            {if $pagination.should_be_displayed}
                <ul class="uk-pagination" uk-margin>
                    {foreach from=$pagination.pages item="page"}
                        <li {if $page.current} class="uk-active" {/if}>
                            <a rel="{if $page.type === 'previous'}prev{elseif $page.type === 'next'}next{else}nofollow{/if}"
                               href="{$page.url}"
                               class="{if $page.type === 'previous'}previous {elseif $page.type === 'next'}next {/if}{['uk-disabled' => !$page.clickable, 'js-search-link' => true]|classnames}"
                            >
                                {if $page.type === 'previous'}
                                    <span uk-pagination-previous></span>
                                {elseif $page.type === 'next'}
                                    <span uk-pagination-next></span>
                                {else}
                                    {$page.page}
                                {/if}
                            </a>
                        </li>
                    {/foreach}
                </ul>
            {/if}
        {/block}
    </div>
    <div class="uk-text-right uk-width-1-3">
        {block name='pagination_summary'}
          {l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=['%from%' => $pagination.items_shown_from ,'%to%' => $pagination.items_shown_to, '%total%' => $pagination.total_items]}
        {/block}
    </div>
</div>
