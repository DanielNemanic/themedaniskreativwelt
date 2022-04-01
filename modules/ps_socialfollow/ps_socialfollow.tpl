{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='block_social'}
<div class="uk-child-width-1-1" uk-grid="">
    <div class="uk-position-relative uk-text-center">
      {foreach from=$social_links item='social_link'}
          <a href="{$social_link.url}" target="_blank">
              <span uk-icon="icon: {$social_link.class}" class="uk-icon-button uk-margin-small-right uk-icon"></span>{$social_link.label}
          </a>
      {/foreach}
    </div>
</div>
{/block}
