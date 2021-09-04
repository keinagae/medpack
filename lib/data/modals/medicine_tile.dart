class MedicineTile{
  String? id;
  String? image;
  String? title;
  String? description;
  MedicineTile({this.id,this.image,this.description,this.title});

  String get detailImage{
    if(image!=null){
      return image!+"&h=900&w=500";
    }
    return "";
  }
}