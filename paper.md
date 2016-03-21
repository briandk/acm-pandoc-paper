---
title: Publishing ACM Papers with Pandoc
author:
  - Andrew Hobden
tags: [Publishing]
abstract: |
  We instruct users how to automatically generate open source ACM proceedings papers with `pandoc`, Github, and Travis CI.
references:
  - id: hoverbear
    title: Hoverbear.org
    author:
        - given: Andrew
          family: Hobden
    type: webpage
    URL: http://hoverbear.org
---

This is a guide by Andrew Hobden. This demos a reference using the provided CSL: @hoverbear.

# Prerequisites

* A good idea.
* Some references.
* Knowledge of how to use markdown.
* (Optional) `pandoc` installed locally along with `texlive-full`.
* A Github account.

# Slipsum

<!-- start slipsum code -->

Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

## Second Paragraph

Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.

Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass.

<!-- please do not remove this line -->

<div style="display:none;">
<a href="http://slipsum.com">lorem ipsum</a></div>

<!-- end slipsum code -->


First, clone the preconfigured repo.

```bash
git clone git@github.com:Hoverbear/acm-pandoc-paper.git
```

After, create a [new Github repository for your paper](https://github.com/new). Don't add any initialization files. *Note:* Travis CI only offers free workers for public repos.

Then you can visit your [Travis CI Profile](https://travis-ci.org/profile) and switch the repository you created to 'on'. *Hint:* You might need to hit "sync".

Since it would be positively outrageous to give Travis your Github password or private key, we'll use what's called an "access token". To get one of these, go to your Github settings and you need to create a "Personal Access Token", you only need to give it the "public_repo" permission. From there you can install the [Travis Gem](https://github.com/travis-ci/travis.rb#installation) and safely encrypt it. Make sure to delete the existing key from `.travis.yml` first, that's mine!

```bash
travis encrypt GH_TOKEN=$YOUR_TOKEN --add env.global
```

Now, point the repo that was cloned to your newly created Github repository. The easiest way of doing this is:

```bash
rm -rf .git
git init
// Add your things and commit.
git remote add origin $YOUR_REPO
git push -u origin master
```

Now every time you push to the repository Travis will go and build a PDF and HTML output page to the `gh-pages` branch of your repository. Your papers will be at `https://$USER.github.io/$REPO/` and `https://$USER.github.io/$REPO/paper.pdf` respectively.

If you want to see the output on your machine just run `make` and check in `out/`.

You can see the example output [here](https://hoverbear.github.io/acm-pandoc-paper/) and [here](https://hoverbear.github.io/acm-pandoc-paper/paper.pdf)

# References
