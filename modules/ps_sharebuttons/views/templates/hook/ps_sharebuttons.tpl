{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='social_sharing'}
  {if $social_share_links}
    <div class="socialSharing uk-width-1-1 uk-width-1-2@s">
      <span uk-icon="icon: social" title="{l s='Share' d='Shop.Theme.Actions'}" uk-tooltip></span>
      {foreach from=$social_share_links item='social_share_link'}
        <a href="{$social_share_link.url}" class="uk-icon-button" title="{$social_share_link.label}" target="_blank" uk-icon="icon:{$social_share_link.class}" uk-tooltip></a>
      {/foreach}
    </div>
  {/if}
{/block}
