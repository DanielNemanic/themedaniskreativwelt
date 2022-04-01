{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $errors|count}
  <div class="uk-alert-danger" uk-alert>
    {block name='form_errors'}
      <ul class="uk-list">
        {foreach $errors as $error}
          <li >{$error|nl2br nofilter}</li>
        {/foreach}
      </ul>
    {/block}
  </div>
{/if}
