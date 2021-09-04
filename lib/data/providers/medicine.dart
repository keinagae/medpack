import 'package:medpack/data/modals/medicine_tile.dart';

class MedicineProvider {
  Future<List<MedicineTile>> getMedicineTileList() async {
    return [
      MedicineTile(
          id: "1",
          image:
              "https://images.pexels.com/photos/161688/medical-tablets-pills-drug-161688.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=700&w=700",
          title: "Acetaminophen",
          description:
              "Acetaminophen is used to treat mild to moderate and pain, to treat moderate to severe pain in conjunction with opiates, or to reduce fever. Common conditions that acetaminophen treats include headache, muscle aches, arthritis, backache, toothaches, sore throat, colds, flu, and fevers."),
      MedicineTile(
          id: "2",
          image:
              "https://images.pexels.com/photos/208512/pexels-photo-208512.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=700&w=700",
        title: "Cyclobenzaprine",
        description: "Cyclobenzaprine is a muscle relaxant. It works by blocking nerve impulses (or pain sensations) that are sent to your brain."
      ),
      MedicineTile(
          id: "3",
          title: "Januvia",
          description: "Januvia (sitagliptin) is an oral diabetes medicine that helps control blood sugar levels. It works by regulating the levels of insulin your body produces after eating.",
          image:
              "https://images.pexels.com/photos/2565761/pexels-photo-2565761.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=700&w=700"),
      MedicineTile(
          id: "4",
          title: "Omeprazole",
          description: "Omeprazole is used to treat symptoms of gastroesophageal reflux disease (GERD) and other conditions caused by excess stomach acid. It is also used to promote healing of erosive esophagitis (damage to your esophagus caused by stomach acid).",
          image:
              "https://images.pexels.com/photos/5863302/pexels-photo-5863302.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=700&w=700"),
      MedicineTile(
          id: "5",
          title: "Cymbalta",
          description: "Cymbalta (duloxetine) is a selective serotonin and norepinephrine reuptake inhibitor antidepressant (SSNRI). Duloxetine affects chemicals in the brain that may be unbalanced in people with depression.",
          image:
              "https://images.pexels.com/photos/3873149/pexels-photo-3873149.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=700&w=700"),
      MedicineTile(
          id: "6",
          title: "Kevzara",
          description: "Kevzara (sarilumab) reduces the effects of a substance in the body that can cause inflammation.",
          image:
              "https://images.pexels.com/photos/3465383/pexels-photo-3465383.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=700&w=700"),
      MedicineTile(
          id: "7",
          title: "Ozempic",
          description: "Ozempic is a pre-filled, disposable, single-patient-use injection pen used along with diet and exercise to improve blood sugar control in adults with type 2 diabetes mellitus.",
          image:
              "https://images.pexels.com/photos/3465383/pexels-photo-3465383.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=700&w=700"),
      MedicineTile(
          id: "8",
          title: "Otezla",
          description: "Otezla (apremilast) inhibits an enzyme within your immune system that can affect certain cells and contribute to inflammation in the body.",
          image:
              "https://images.pexels.com/photos/4021812/pexels-photo-4021812.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=700&w=700"),
      MedicineTile(
          id: "9",
          title: "Entresto",
          description:"ntresto contains a combination of sacubitril and valsartan. Sacubitril is a blood pressure medicine. It works by increasing the levels of certain proteins in the body that can dilate (widen) blood vessels. This helps lower blood pressure by reducing sodium levels.",
          image:
              "https://images.pexels.com/photos/208512/pexels-photo-208512.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=700&w=700"),
    ];
  }
}
