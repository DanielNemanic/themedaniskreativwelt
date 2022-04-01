{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <div class="uk-alert-success" uk-alert>
    <ul class="uk-list">
      {foreach $successes as $success}
        <li>
          <span uk-icon="icon: check"></span> {$success}
        </li>
      {/foreach}
    </ul>
  </div>

  <div class="uk-width-1-1">
    <a href="{$urls.pages.authentication}">{l s='Back to Login' d='Shop.Theme.Actions'}</a>
  </div>
{/block}

