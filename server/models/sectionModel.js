class Section {
    constructor(Title, Picture, Description, Adress,Number_Of_Comments,Rating,Post_Owner,Tags
     ) {
            this.Title = Title;
            this.Picture = Picture;
            this.Description = Description;
            this.Adress = Adress;
            this.Number_Of_Comments = Number_Of_Comments;
            this.Rating = Rating;
            this.Post_Owner=Post_Owner;
            this.Tags=Tags;
    }
}

module.exports = Section;