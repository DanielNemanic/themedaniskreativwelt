{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Reset your password' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
    <form action="{$urls.pages.password}" method="post" class="uk-form-stacked">
      <ul class="uk-list">
        {foreach $errors as $error}
          <li>
            <span uk-icon="icon: warning"></span>
            <p>{$error}</p>
          </li>
        {/foreach}
      </ul>

      <div class="email uk-margin">
        {l
        s='Email address: %email%'
        d='Shop.Theme.Customeraccount'
        sprintf=['%email%' => $customer_email|stripslashes]}
      </div>

      <div class="uk-margin">
        <label class="uk-form-label">{l s='New password' d='Shop.Forms.Labels'}</label>
        <div class="uk-form-controls">
          <input class="uk-input" type="password" data-validate="isPasswd" name="passwd" value="">
        </div>
      </div>

      <div class="uk-margin">
        <label class="uk-form-label">{l s='Confirmation' d='Shop.Forms.Labels'}</label>
        <div class="uk-form-controls">
          <input class="uk-input" type="password" data-validate="isPasswd" name="confirmation" value="">
        </div>
      </div>

      <div class="uk-margin">
        <div class="uk-form-controls">
          <input type="hidden" name="token" id="token" value="{$customer_token}">
          <input type="hidden" name="id_customer" id="id_customer" value="{$id_customer}">
          <input type="hidden" name="reset_token" id="reset_token" value="{$reset_token}">
          <button class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt" type="submit" name="submit">
            {l s='Change Password' d='Shop.Theme.Actions'}
          </button>
        </div>
      </div>
    </form>
{/block}

{block name='page_footer'}
  <ul>
    <li><a href="{$urls.pages.authentication}">{l s='Back to Login' d='Shop.Theme.Actions'}</a></li>
  </ul>
{/block}
