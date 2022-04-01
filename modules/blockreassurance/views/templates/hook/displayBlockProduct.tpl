{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="blockreassurance_product uk-margin-medium-top" >
    <ul class="uk-list uk-list-divider uk-margin">
    {foreach from=$blocks item=$block key=$key}
        <li{if $block['type_link'] !== $LINK_TYPE_NONE && !empty($block['link'])} style="cursor:pointer;" onclick="window.open('{$block['link']}')"{/if}>
            {if $block['icon'] != 'undefined'}
                {if $block['icon']}
                <img loading="lazy" class="svg invisible" src="{$block['icon']}" width="25px">
                {elseif $block['custom_icon']}
                <img {if $block['is_svg']}class="svg invisible" {/if}src="{$block['custom_icon']}" loading="lazy">
                {/if}
            {/if}&nbsp;
            {if empty($block['description'])}
              {$block['title']}
            {else}
              {$block['title']}
              <p style="color:{$textColor};">{$block['description'] nofilter}</p>
            {/if}
        </li>
    {/foreach}
    </ul>
</div>
