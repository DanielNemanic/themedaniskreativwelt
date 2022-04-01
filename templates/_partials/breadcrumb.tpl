{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $breadcrumb.count > 1}
    <div class="uk-section uk-section-xsmall">
        <div class="uk-container">
            <ul class="uk-breadcrumb">
                {block name='breadcrumb'}
                    {foreach from=$breadcrumb.links item=path name=breadcrumb}
                        <li><a href="{$path.url}"><span itemprop="name">{$path.title}</span></a></li>
                    {/foreach}
                {/block}
            </ul>
        </div>
    </div>
{/if}
