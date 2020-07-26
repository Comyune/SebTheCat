+++
title = "Stuck Strategy - What to do when you're stuck in code"
description = "Let's explore our stuck strategy. What do we do when we're stuck?"
date = "2020-07-26"
published = true
tags = [
  "productivity",
  "development",
  "workflow",
]
categories = [
  "productivity"
]
+++

Getting stuck really sucks. It can be soul-crushing.

As developers, what do we do when we are stuck? 
We have a process for code review, unit testing and deployment.
 
What is your process for when I get stuck though?

![https://unsplash.com/@tomastuma?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText](/images/stuckcat.jpg)

---

I ran into a really frustrating problem during my live stream and after _hours_ of struggling with it I just had to call it a day.

Speaking with a friend that evening, they asked me how the stream had gone and I lamented my getting stuck.

Their response inspired me to write this post.

> You stream to help people learn, right? Maybe watching a professional work through hard problems is more useful to your audience than seeing you do everything as if by magic.

They were right.

The next day, instead of the previous feeling of dread at facing my own inadequacies, I felt inspired to build a strategy for when I was stuck, publish it, and ask for feedback and improvements from the broader development community.

So here we are. Please suggest additional steps in the comments!

---

![https://unsplash.com/@maxchen2k?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText](/images/backtrace.jpg)

## Step 1: Collect Information

This seems like the obvious place to start.

Collect everything you can about the issue and put it in a file. I use a simple markdown editor to take notes while I work or stream.

* __Copy the error__
  <br />
  Copy _the exact_ error into your file.

* __Read the error carefully__
  <br />
  Like _actually_ read it.
  
* __Investigate and record the backtrace__
  <br />
  If you have a backtrace, step through it and read the surrounding code. If anything looks suspicious, copy it into your file too.

* __Re-read documentation__
  <br />
  Go through any documentation around the code or tool in question.
  Copy links or documentation into your file.

* __Look for code examples__
  <br />
  Search the documentation for relevant examples and stick them into your document as well.
  
---

![https://unsplash.com/@nathanareboucas?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText](/images/googlesearch.jpg)

## Step 2: Ask Google

You may be surpised that a Google search wasn't step 1. Let's be honest, you probably did a Google search before you even considered yourself __"stuck"__.

There is a reason this is step 2. Without the previous step (collecting information), you would be jumping into an ocean of information without arming yourself with some of your own.

Google is infamously good at solving programming problems, until when it isn't. Then you're really fucked. So do your research first. It's too easy to get lost in pages of results otherwise.

* __Search the exact error__
  <br />
  This should be your beginning point.
  <br />
  `Uncaught TypeError: fs.existsSync is not a function at getElectronPath`
  
* __Add quotes in appropriate places__
  <br />
  If you don't know how to use quotes in Google searches,
  [I'd suggest learning them here](http://www.googleguide.com/quote_operator.html).
  You should look at which parts of the error should always be considered together.
  <br />
  `Uncaught TypeError: "fs.existsSync is not a function" at getElectronPath`
  
* __Search the error without project-specific terms__
  <br />
  Try and remove terms which are specific to your particular implementation. In the example, "uncaught" is probably not too relevant and `getElectronPath` may not be the only context which triggers the error. So let's strip that out.
  <br />
  `TypeError: fs.existsSync is not a function`

* __Search for "what you are trying to achieve" instead__
  <br />
  Maybe you're trying to do the thing you're trying to do in the wrong way. This is a good way to sanity check.
  
Remember, if you find any possible solutions, record them in your document!
  
---

![https://unsplash.com/@anniespratt?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText](/images/colleague.jpg)


## Step 3: Ask a Human Asynchronously

Depending on your company culture, this step may come earlier or later.
I __do__ think it's important to ensure that you reach out asynchronously first.

I believe people should consider their colleagues' time and attention to be the most precious resource in any organization.

This means Slack, Microsoft Teams or god forbid E-mail.

---

![https://unsplash.com/@punttim?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText](/images/frustration.jpg)

## Step 4: Reproduce the Error in a Simplified Manner

This is a technique I often forget, but can prove invaluable in your quest for answers.

The basic idea is this: reduce the problem space.

This means either commenting out or removing parts of your system until you can't remove anything else.

Alternatively, you can try and work in the opposite direction and try and _build_ the minimum amount of surface area before you run into your issue. This strategy often means starting an entirely fresh project and rebuilding a tiny subsection of functionality in isolation.

---

![https://stackoverflow.com](/images/stackoverflow.jpg)

## Step 5: Stack Overflow

Stack Overflow doesn't hold the highest reputation for friendliness, but this is usually because people who ask questions there have been lazy and not done the appropriate work to prepare their question.

That's why you should _always_ search for your question first. Be considerate. 

Ask on Stack Overflow, but make sure to use your handy document (there was a reason to record all of this after all!) for reference. Post context, be descriptive, be polite.

---

![https://unsplash.com/@glenncarstenspeters?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText](/images/typing.jpg)

## Step 6: IRC / Gitter / Reddit

Now we're getting desperate.

Fortunately, you'll often find that particular libraries and ecosystems have their own IRC channels. Yeah. IRC. Remember that?
[Check out FreeNode IRC here.](https://webchat.freenode.net/)

Barring that, check out [Gitter](https://gitter.im). If you're not familiar, Gitter is a instant messaging platform that plugs into Github and other coding tools to build communities around particular software libraries.

If you get really desperate, try checking your programming language's subreddit.
[For instance, here is the Javascript one.](reddit.com/r/javascript)

---

![https://unsplash.com/@lukechesser?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText](/images/github.jpg)

## Step 7: GitHub (Issue)

Okay. Maybe you're not the problem. Maybe it's a bug in __someone else's code__. **GASP**. I know, you certainly didn't think that before now right? ;)

So, let's use the same principles of considerate detail that we used with Stack Overflow here.

Let's create a GitHub issue. __But before you do__, re-read the documentation _again_.
And while you're here, you may as well read the source code and look at more recent versions of the software that might already contain the fix you need!

Create a Git issue in the library you believe to be the cause.

Be polite and don't assume they are wrong. You're probably doing something stupid.
I've been doing this shit for over 2 decades and I do _incredibly_ stupid things in my code almost hourly.

---

![https://unsplash.com/@oowgnuj?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText](/images/up.jpg)

## Step 8: Can we do it better?

Can you implement what you want to do in an _even_ better way?

Stop. Think about it.

What if you could achieve what you're trying to do without using this tool, or method, or class?
Could you do this thing in an _even better_ way, that circumvents this whole problem entirely?

---

![https://unsplash.com/@ussamaazam?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText](/images/down.jpg)

## Step 9: Can we get it working, worse?

We're getting to the end of our metaphorical tether. Okay. Deep breath.

What could we do to get this working "quick and dirty"?

What that be enough? Is there a "lo-fi" or "low-tech" solution here that allows us to dodge this issue?

---

![https://unsplash.com/@jlcruz_photography?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText](/images/rubberduck.jpg)

## Step 10: Rubber Ducking

[The ancient Chinese art of "Rubber Ducking"](https://en.wikipedia.org/wiki/Rubber_duck_debugging).

This is a technique where you talk to an inanimate object like a lunatic. It actually works.
Go find some private place (unless you already have a reputation for psychotic breaks).

Speak through your problem out loud. Externalizing the problem usually helps us approach it from a new perspective.

---

![https://unsplash.com/@judmackrill?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText](/images/mobbing.jpg)

## Step 11: Ask a Colleague Synchronously

Okay, by now your colleague should have responded to your earlier request. If they haven't, they are ignoring you because they can detect your terror.

At this point you have my permission to interupt their ass. If they complain, send them my way. Really. I could use the publicity.

__Pair on the problem.__

Don't just ask them questions. Get them looking at the code. Run them through it.

Your goal here __is not to share your pain__, it's to __share your understanding of the problem__. Remember this.

Oh yeah, show them the massive document you've prepared with everything you've found out and tried.

---

![https://unsplash.com/@lnalex?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText](/images/endgame.jpg)

## The Endgame

When you find your solution don't just forget the process and dump all of your good work.

You'll probably encounter this problem again, and if you won't, someone else will.

Take your notes and write them up. Post them on your company's development wiki. Even better, post them on a blog somewhere. Share the love brah. Please!

---

![https://unsplash.com/@timmarshall?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText](/images/love.jpg)
## In Conclusion

This was just what I came up with.

If you have any recommendations... additional steps, reordering or improvements __please comment__!
I'd love to add to this. :) Getting stuck _really sucks_. It can be soul-crushing.

So. Share the love. <3

