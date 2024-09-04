# `chevron`: Standard TLGs for clinical trials reporting <a href='https://insightsengineering.github.io/chevron/'><img src="man/figures/chevron.png" align="right" height="139" style="max-width: 100%; max-height: 139px;"/></a>

<!-- start badges -->
[![Check 🛠](https://github.com/insightsengineering/chevron/actions/workflows/check.yaml/badge.svg)](https://insightsengineering.github.io/chevron/main/unit-test-report/)
[![Docs 📚](https://github.com/insightsengineering/chevron/actions/workflows/docs.yaml/badge.svg)](https://insightsengineering.github.io/chevron/)
[![Code Coverage 📔](https://raw.githubusercontent.com/insightsengineering/chevron/_xml_coverage_reports/data/main/badge.svg)](https://insightsengineering.github.io/chevron/main/coverage-report/)

![GitHub forks](https://img.shields.io/github/forks/insightsengineering/chevron?style=social)
![GitHub repo stars](https://img.shields.io/github/stars/insightsengineering/chevron?style=social)

![GitHub commit activity](https://img.shields.io/github/commit-activity/m/insightsengineering/chevron)
![GitHub contributors](https://img.shields.io/github/contributors/insightsengineering/chevron)
![GitHub last commit](https://img.shields.io/github/last-commit/insightsengineering/chevron)
![GitHub pull requests](https://img.shields.io/github/issues-pr/insightsengineering/chevron)
![GitHub repo size](https://img.shields.io/github/repo-size/insightsengineering/chevron)
![GitHub language count](https://img.shields.io/github/languages/count/insightsengineering/chevron)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Current Version](https://img.shields.io/github/r-package/v/insightsengineering/chevron/main?color=purple\&label=package%20version)](https://github.com/insightsengineering/chevron/tree/main)
[![Open Issues](https://img.shields.io/github/issues-raw/insightsengineering/chevron?color=red\&label=open%20issues)](https://github.com/insightsengineering/chevron/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc)
<!-- end badges -->

`chevron` is a collection of high-level functions to create standard outputs for clinical trials reporting with limited parameterisation. These outputs includes:

<!-- markdownlint-disable MD007 MD030 -->

- [Tables](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#tables):
     - safety table, e.g.
          - [Safety Summary (`AET01`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#safety-summary-aet01)
     - adverse events table, e.g.
          - [Adverse Events (`AET02`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#adverse-events-aet02)
          - [Adverse Events by Greatest Intensity (`AET03`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#adverse-events-by-greatest-intensityaet03)
          - [Most Common (>=5%) Adverse Events (`AET10`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#most-common-5-adverse-events-aet10)
     - demographic table, e.g.
          - [Demographics and Baseline Characteristics (`DMT01`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#demographics-and-baseline-characteristics-dmt01)
     - ECG table, e.g.
          - [ECG Results and Change from Baseline by Visit (`EGT01`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#ecg-results-and-change-from-baseline-by-visit-egt01)
          - [ECG Abnormalities (Regardless of Abnormality at Baseline) (`EGT02_1`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#ecg-abnormalities-regardless-of-abnormality-at-baseline-egt02_1)
          - [ECG Abnormalities (Among Subject Without Abnormality at Baseline) (`EGT02_2`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#ecg-abnormalities-among-subject-without-abnormality-at-baseline-egt02_2)
     - lab results table, e.g.
          - [Laboratory Test Results and Change from Baseline by Visit (`LBT01`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#laboratory-test-results-and-change-from-baseline-by-visit-lbt01)
          - [Laboratory Abnormalities (`LBT04`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#laboratory-abnormalities-lbt04)
          - [Laboratory Abnormalities with Single and Replicated Marked (`LBT05`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#laboratory-abnormalities-with-single-and-replicated-marked-lbt05)
     - medical history table, e.g.
          - [Medical History (`MHT01`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#medical-history-mht01)
     - response table, e.g.
          - [Best Overall Response (`RSPT01`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#best-overall-response-rspt01)
     - time to event table, e.g.
          - [Time-to-event Summary (`TTET01`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#time-to-event-summary-ttet01)
     - vital signs, e.g.
          - [Vital Signs (`VST01`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#vital-signs-vst01)
          - [Vital Signs Abnormalities (Regardless of Abnormality at Baseline) (`VST02_1`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#vital-signs-abnormalities-regardless-of-abnormality-at-baseline-vst02_1)
          - [Vital Signs Abnormalities (Among Subject Without Abnormality at Baseline) (`VST02_2`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#vital-signs-abnormalities-among-subject-without-abnormality-at-baseline-vst02_2)
- [Listings](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#listings)
- [Graphs](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#graphics):
     - [Kaplan-Meier Plot (`KMG01`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#kaplan-meier-plot-kmg01)
     - [Mean Plot (`MNG01`)](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html#mean-plot-mng01)

<!-- markdownlint-enable MD007 MD030 -->

Please visit [the catalog](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron_catalog.html) to see full list of available outputs. If you want a new output, please [create an issue](https://github.com/insightsengineering/chevron/issues/new?template=new_table.yml).

If you need more flexibility please refer to [`tern`](https://insightsengineering.github.io/tern/) with its [TLG Catalog](https://insightsengineering.github.io/tlg-catalog/).

## Installation

`chevron` is available on CRAN and you can install the latest released version with:

```r
install.packages("chevron")
```

Alternatively, you might also use the development version.

```r
# install.packages("pak")
pak::pak("insightsengineering/chevron")
```

## Usage

To understand how to use this package, please refer to the [Introduction to `chevron`](https://insightsengineering.github.io/chevron/latest-tag/articles/chevron.html) article, which provides multiple examples of code implementation.

Below is the showcase of the example usage.

```r
library(chevron)

data(syn_data)
run(aet02, syn_data)
```

which returns

```text
  MedDRA System Organ Class                                     A: Drug X    B: Placebo    C: Combination
    MedDRA Preferred Term                                        (N=134)       (N=134)        (N=132)
  ———————————————————————————————————————————————————————————————————————————————————————————————————————
  Total number of patients with at least one adverse event     122 (91.0%)   123 (91.8%)    120 (90.9%)
  Overall total number of events                                   609           622            703
  cl A.1
    Total number of patients with at least one adverse event   78 (58.2%)    75 (56.0%)      89 (67.4%)
    Total number of events                                         132           130            160
    dcd A.1.1.1.1                                              50 (37.3%)    45 (33.6%)      63 (47.7%)
    dcd A.1.1.1.2                                              48 (35.8%)    48 (35.8%)      50 (37.9%)
  cl B.2
    Total number of patients with at least one adverse event   79 (59.0%)    74 (55.2%)      85 (64.4%)
    Total number of events                                         129           138            143
    dcd B.2.2.3.1                                              48 (35.8%)    54 (40.3%)      51 (38.6%)
    dcd B.2.1.2.1                                              49 (36.6%)    44 (32.8%)      52 (39.4%)
  cl D.1
    Total number of patients with at least one adverse event   79 (59.0%)    67 (50.0%)      80 (60.6%)
    Total number of events                                         127           106            135
    dcd D.1.1.1.1                                              50 (37.3%)    42 (31.3%)      51 (38.6%)
    dcd D.1.1.4.2                                              48 (35.8%)    42 (31.3%)      50 (37.9%)
  cl D.2
    Total number of patients with at least one adverse event   47 (35.1%)    58 (43.3%)      57 (43.2%)
    Total number of events                                         62            72              74
    dcd D.2.1.5.3                                              47 (35.1%)    58 (43.3%)      57 (43.2%)
  cl B.1
    Total number of patients with at least one adverse event   47 (35.1%)    49 (36.6%)      43 (32.6%)
    Total number of events                                         56            60              62
    dcd B.1.1.1.1                                              47 (35.1%)    49 (36.6%)      43 (32.6%)
  cl C.2
    Total number of patients with at least one adverse event   35 (26.1%)    48 (35.8%)      55 (41.7%)
    Total number of events                                         48            53              65
    dcd C.2.1.2.1                                              35 (26.1%)    48 (35.8%)      55 (41.7%)
  cl C.1
    Total number of patients with at least one adverse event   43 (32.1%)    46 (34.3%)      43 (32.6%)
    Total number of events                                         55            63              64
    dcd C.1.1.1.3                                              43 (32.1%)    46 (34.3%)      43 (32.6%)
```

## Related

- [`rtables`](https://insightsengineering.github.io/rtables/) - table engine used
- [`tern`](https://insightsengineering.github.io/tern/) - analysis function used

## Acknowledgment

This package is a result of a joint efforts by many developers and stakeholders. We would like to thank everyone who has contributed so far!

## Stargazers and Forkers

### Stargazers over time

[![Stargazers over time](https://starchart.cc/insightsengineering/chevron.svg)](https://starchart.cc/insightsengineering/chevron)

### Stargazers

[![Stargazers repo roster for chevron](https://reporoster.com/stars/insightsengineering/chevron)](https://github.com/insightsengineering/chevron/stargazers)

[![Forkers repo roster for chevron](https://reporoster.com/forks/insightsengineering/chevron)](https://github.com/insightsengineering/chevron/network/members)
