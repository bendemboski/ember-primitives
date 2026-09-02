import { clearRender, render } from '@ember/test-helpers';
import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';

import { Popover } from 'ember-primitives';

module('Rendering | popover', function (hooks) {
  setupRenderingTest(hooks);

  test('it uninstalls anchorTo', async function (assert) {
    await render(
      <template>
        <Popover @placement="bottom" as |p|>
          <span {{p.reference}}></span>
          <p.Content>
            Hi
          </p.Content>
        </Popover>
      </template>
    );

    await clearRender();

    const win = window as typeof window & { anchorToInstallCount?: number };

    assert.strictEqual(win.anchorToInstallCount, 0);
  });
});
