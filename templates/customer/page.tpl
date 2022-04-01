{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='page.tpl'}

{block name='page_content_container'}

    {include file='customer/leftColumn.tpl'}

    <div class="uk-width-1-1 uk-width-3-4@s uk-child-width-1-1 customerOverview uk-margin-small-top" uk-grid>
        <div>
            {block name='page_content'}
              <!-- Page content -->
            {/block}
        </div>
    </div>
{/block}

{block name='page_footer'}
  {block name='my_account_links'}
    {include file='customer/_partials/my-account-links.tpl'}
  {/block}
{/block}
