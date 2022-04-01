{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='layouts/layout-both-columns.tpl'}

{block name='left_column'}{/block}
{block name='right_column'}{/block}

{block name='content_wrapper'}
    {block name='breadcrumb'}
        <div class="uk-width-1-1">
            {include file='_partials/breadcrumb.tpl'}
        </div>
    {/block}
    {block name='notifications'}
        {include file='_partials/notifications.tpl'}
    {/block}
    {hook h="displayContentWrapperTop"}
    {block name='content'}
      <p>Hello world! This is HTML5 Boilerplate.</p>
    {/block}
    {hook h="displayContentWrapperBottom"}
{/block}