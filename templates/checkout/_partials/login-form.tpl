{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='customer/_partials/login-form.tpl'}

{block name='form_buttons'}
  <button
    class="continue uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt"
    name="continue"
    data-link-action="sign-in"
    type="submit"
    value="1"
  >
    {l s='Continue' d='Shop.Theme.Actions'}
  </button>
{/block}
