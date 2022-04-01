{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-container uk-margin-top uk-margin-large-bottom">
  <div class="uk-child-width-1-1 " uk-grid>
    {block name='copyright_link'}
      <div class="uk-text-center">
        <h2 class="daniskreativwelt">DanisKreativwelt</h2>
      </div>
    {/block}
  </div>

  <div class="uk-child-1-1" uk-grid>
    <div>
      <sup>1</sup>Endpreise, aufgrund des Kleinunternehmerstatus gem. § 19 UStG erheben wir keine Umsatzsteuer und weisen diese daher auch nicht aus.
    </div>
  </div>
  <div class="uk-child-width-1-1" uk-grid>
    {block name='hook_footer_before'}
      {hook h='displayFooterBefore'}
    {/block}
  </div>

  {block name='hook_footer'}
    <div class="uk-child-width-1-1 uk-child-width-1-4@s" uk-grid>
      {hook h='displayFooter'}
    </div>
  {/block}
  <div class="uk-child-width-1-1" uk-grid>
    {block name='hook_footer_after'}
      {hook h='displayFooterAfter'}
    {/block}
  </div>
  <div class="uk-child-width-1-1" uk-grid>
    {block name='copyright_link'}
      {l s='%copyright% %year% - Online Shop by %dn%' sprintf=['%dn%' => 'DanisKreativwelt', '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}
    {/block}
  </div>
</div>