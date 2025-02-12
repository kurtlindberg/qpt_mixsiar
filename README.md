# qpt_mixsiar

Scripts for plant wax mixing model (MixSIAR) experiments and results processing for Lake QPT, Baffin Island, Nunavut, Canada (Lindberg et al., in prep).

**Manuscript Title**: Bayesian modeling plant wax sources to an Eastern Canadian Arctic lake sediment record reveals stable plant wax vegetation sources following postglacial shrub colonization

**Authors**: Kurt R. Lindberg, Elizabeth K. Thomas, Martha K. Raynolds, Helga Bultmann

## MixSIAR Workflow

1. **Generate model input files**
   
- **Mix**: 
  
- **Source**
 - Means and standard deviations of user-defined vegetation endmembers in the Python inputs script. Endmember statistics are created from individual samples in "qpt_plantwax_source.xlsx"
 - Note (02/11/2025): Published Lake QPT plant wax endmember data (Hollister et al., 2022; DOI: https://doi.org/10.1029/2022JG006903) currently available. Eastern Canadian Arctic plant wax data not yet published as part of Lindberg et al. (in prep): *Ecological and environmental controls on plant wax production and stable isotope fractionation in modern terrestrial Arctic vegetation*
 - Lake QPT plant wax endmember data from Hollister et al. (2022) is publically available on figshare: https://figshare.com/s/96c3bd6c11bae87c1e28?file=34381742

- **Discr**: Discrimination factors that account for potential alteration/fractionation between the endmember and mixture. These factors are not well-defined in sedimentary mixing studies (Menges et al., 2020), so the Python input script sets them all to "0".

2. Run model experiments
   
3. Generate plots from output summaries

## References

Hollister, K. V., Thomas, E. K., Raynolds, M. K., Bültmann, H., Raberg, J. H., Miller, G. H., & Sepúlveda, J. (2022). Aquatic and terrestrial plant contributions to sedimentary plant waxes in a modern Arctic lake setting. Journal of Geophysical Research: Biogeosciences, 127(8), e2022JG006903.

Lindberg, K.R., Thomas, E.K., Raynolds, M.K., Bultmann, H. 2024 (talk) *Evaluating plant waxes as tracer for reconstructing mid-late Holocene vegetation change in a sourthern Baffin Island lake catchment* The 52nd International Arctic Workshop, Amherst, MA, Mar. 13-16.

Menges, J., Hovius, N., Andermann, C., Lupker, M., Haghipour, N., Märki, L., & Sachse, D. (2020). Variations in organic carbon sourcing along a trans-Himalayan river determined by a Bayesian mixing approach. Geochimica et Cosmochimica Acta, 286, 159-176.

Stock, Brian C., Andrew L. Jackson, Eric J. Ward, Andrew C. Parnell, Donald L. Phillips, and Brice X. Semmens. "Analyzing mixing systems using a new generation of Bayesian tracer mixing models." PeerJ 6 (2018): e5096.


