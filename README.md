# QiXin
Qixin: a neural rhythm coding system for improving two-person collaborative intelligence
## How to apply

  1.First, you must have the [eeglab](https://sccn.ucsd.edu/eeglab/download.php) and [fildtrip](https://www.fieldtriptoolbox.org/download/) toolkits installed in matlab
  
  2.To ensure proper operation of the program, you may need:
  
  [XiPi](https://github.com/ShiangHu/Xi-Pi), a neural rhythm separation kit;
  
  [isceeg](https://www.youtube.com/watch?v=DEo-rw2TeAU), a kit for calculating inter-brain ISC values.
  
  3.Note that your matlab working path is moved to the QiXin file path
  
  4.After ensuring that the correct environment is configured, run the main.m file.
  
## What is QiXin

  Based on the existing research techniques of neural rhythm synchronization and the potential application value of combining hyperscanning with social neuroscience, a novel neural rhythm coding system is designed in this paper. The main components of the system are decoding, encoding and feedback modulation. The main functions include inputting and preprocessing the EEG data of two people (supporting the mainstream preprocessing methods, It includes artifact removal, independent component analysis), calculation of inter-brain synchronization ISC index, extraction of periodic components from EEG data and quantification of neural rhythm characteristics, encoding stimulus sequences based on periodic components, modulating stimulus signals, etc. The system uses the combination of reinforcement learning and neurofeedback to explore better selection strategies from the feasibility space of multiple stimulus experiments. 
  
## Reference

  [1]Hu J, Turgut A E, Krajník T, et al. Occlusion-Based Coordination Protocol Design for Autonomous Robotic Shepherding Tasks[J]. IEEE Transactions on Cognitive and Developmental Systems, 2022, 14(1): 126-135.
  
  [2] 中国人工智能产业发展联盟. 脑机接口技术在医疗健康领域应用白皮书[R], 2021: 1—10.
  
  [3]Schomer D L, Lopes da Silva F H, Amzica F, et al. 20C2Cellular Substrates of Brain Rhythms. Niedermeyer’s Electroencephalography: Basic Principles, Clinical Applications, and Related Fields[M]. 2017-11. Oxford University Press, 2017.
  
  [4] Zhang D. Computational EEG Analysis for Hyperscanning and Social Neuroscience. 2018, 2018: 215-228.
  
  [5] Cohen S S, Parra L C. Memorable audiovisual narratives synchronize sensory and supramodal neural responses[J]. eNeuro, 2016, 3(6).
  
  [6] TenHouten W, Schussel L, Gritsch M F, et al. Hyperscanning and the Future of Neurosociology[J]. Sociological Methodology, 2023, 53(1): 139-157.
  
  [7] Turk, Elise, et al. "Brains in Sync: Practical Guideline for Parent–Infant EEG During Natural Interaction." Frontiers in Psychology 13 (2022): 833112-833112.
  
  [8] Ayrolles A, Brun F, Chen P, et al. HyPyP: A Hyperscanning Python Pipeline for inter-brain connectivity analysis[J]. Social Cognitive and Affective Neuroscience, 2021, 16(1-2): 72-83.
  
  [9] Kayhan E, Matthes D, Marriott Haresign I, et al. DEEP: A dual EEG pipeline for developmental hyperscanning studies[J]. Developmental Cognitive Neuroscience, 2022, 54. 
  
  [10] 上海市神经科学学会与神经调控分会. 脑机交互神经调控前沿进展白皮书[R], 2022: 40
  
  [11] 刘佳. 基于alpha波相位解码与外部调控的神经反馈技术研究[D].深圳大学生物医学工程学院,2019.
  
  [12] Chen P, Hendrikse S, Sargent K, et al. Hybrid Harmony: A Multi-Person Neurofeedback Application for Interpersonal Synchrony[J]. Frontiers in Neuroergonomics, 2021, 2.
  
  [13] Lubianiker N, Paret C, Dayan P, et al. Neurofeedback through the lens of reinforcement learning[J]. Trends in Neurosciences, 2022, 45(8): 579-593.
  
  [14]Hu S, Yao D, Bringas-Vega M L, et al. The Statistics of EEG Unipolar References: Derivations and Properties[J]. Brain Topography, 2019, 32(4): 696-703.
  
  [15]Yao D, Qin Y, Hu S, et al. Which Reference Should We Use for EEG and ERP practice?[J]. Brain Topography, 2019, 32(4): 530-549.
  
  [16] Parra L C ,  Haufe S ,  Dmochowski J P . Correlated Components Analysis --- Extracting Reliable Dimensions in Multivariate Data[J].  2018.
  
  [17] Hossain M Z , Rahman M A . Inter subject inconsistency measures of EEG data on the basis of correlation dimension. 2013.
