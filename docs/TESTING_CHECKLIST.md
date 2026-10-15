# Portfolio Testing Checklist

Use this checklist before publishing changes to the portfolio.

## Code Quality
- [ ] Run `flutter analyze`.
- [ ] Fix any errors introduced by the changes.
- [ ] Review warnings and remove unused code where appropriate.

## Automated Tests
- [ ] Run `flutter test`.
- [ ] Confirm all tests pass.
- [ ] Add or update tests when application behavior changes.

## Web Build
- [ ] Run the production web build.
- [ ] Confirm the build completes successfully.
- [ ] Check that the GitHub Pages base path is configured correctly.

## Visual Review
- [ ] Check the portfolio in desktop Chrome.
- [ ] Check the layout at a mobile viewport.
- [ ] Confirm text and buttons are readable.
- [ ] Verify that project and profile links work.
- [ ] Confirm images and the presenter display correctly.

## Publishing
- [ ] Review changes with `git diff`.
- [ ] Commit the verified changes.
- [ ] Push to the `main` branch.
- [ ] Confirm the GitHub Actions deployment succeeds.
- [ ] Open the live website and verify the update.
