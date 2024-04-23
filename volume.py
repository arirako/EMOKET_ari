import ants
import click
import numpy as np
from rich.console import Console
from rich.table import Table

CLASS_LABELS = ["Dentate Gyrus", "CA1", "CA2/CA3", "Subiculum"]


@click.command()
@click.argument("input_segmentation", type=click.Path(exists=True))
def main(input_segmentation):
    table = Table(title=f"Volume of {input_segmentation.split('/')[-1]}")
    table.add_column("Region")
    table.add_column("Volume (mm^3)")

    segmentation = ants.image_read(input_segmentation)
    voxel_volume = np.prod(segmentation.spacing)

    segmentation_np = segmentation.numpy()
    for i, name in enumerate(CLASS_LABELS):
        volume = np.sum(segmentation_np == (i + 1))
        volume *= voxel_volume
        table.add_row(name, f"{volume:.2f}")

    console = Console()
    console.print(table)


if __name__ == "__main__":
    main()
