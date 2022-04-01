{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $elements}
  <div id="blockReassurance uk-margin">
    <ul class="uk-list uk-list-divider uk-margin">
      {foreach from=$elements item=element}
        <li>
          <div class="block-reassurance-item">
            <img loading="lazy" src="{$element.image}" alt="{$element.text}">
            <span class="h6">{$element.text}</span>
          </div>
        </li>
      {/foreach}
    </ul>
  </div>
{/if}
