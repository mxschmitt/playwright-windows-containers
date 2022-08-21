import { test, expect } from '@playwright/test';

test('homepage has Playwright in title and get started link linking to the intro page', async ({ page, browserName }) => {
  await page.goto('https://playwright.dev/');

  console.log(`Hello from ${browserName} - ${await page.evaluate(() => window.navigator.userAgent)}`);

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/Playwright/);

  // create a locator
  const getStarted = page.locator('text=Get Started');

  // Expect an attribute "to be strictly equal" to the value.
  await expect(getStarted).toHaveAttribute('href', '/docs/intro');

  // Click the get started link.
  await getStarted.click();

  // Expects the URL to contain intro.
  await expect(page).toHaveURL(/.*intro/);
});
