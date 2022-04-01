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
  <form action="{$urls.pages.password}" class="forgotten-password uk-form-stacked" method="post">

    {if $error}
      <div class="uk-allert-danger" uk-alert>
        <ul class="uk-list">
          {foreach $errors as $error}
            <li>
              <span uk-icon="icon: check"></span>
              {$error}
            </li>
          {/foreach}
        </ul>
      </div>
    {/if}

    <div class="uk-width-1-1">
      {l s='Please enter the email address you used to register. You will receive a temporary link to reset your password.' d='Shop.Theme.Customeraccount'}
    </div>

    <div class="uk-margin">
      <label class="uk-form-label required">{l s='Email address' d='Shop.Forms.Labels'}</label>
      <div class="uk-form-controls">
          <input type="email" name="email" id="email" value="{if isset($smarty.post.email)}{$smarty.post.email|stripslashes}{/if}" class="uk-input" required>
      </div>
    </div>

    <div class="uk-margin">
      <button class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt uk-visible@s" name="submit" type="submit">
        {l s='Send reset link' d='Shop.Theme.Actions'}
      </button>
      <button class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt uk-hidden@s" name="submit" type="submit">
        {l s='Send' d='Shop.Theme.Actions'}
      </button>
    </div>
  </form>
{/block}

{block name='page_footer'}
  <a href="{$urls.pages.my_account}" class="account-link">
    <i class="material-icons">&#xE5CB;</i>
    <span>{l s='Back to login' d='Shop.Theme.Actions'}</span>
  </a>
{/block}
