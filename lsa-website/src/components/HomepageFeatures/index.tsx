import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>>;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Persistent',
    Svg: require('@site/static/img/carrier2.svg').default,
    description: (
      <>
        The state of the campaign persist from mission to mission. 
        Plan ahead and use assets efficiently as they will be there the next session.
      </>
    ),
  },
  {
    title: 'Challenging',
    Svg: require('@site/static/img/fighter.svg').default,
    description: (
      <>
        Test your skills in a mission that ask of you more than it gives.
        Brush up on navigation, communication, as well as your aircraft. You'll need it.
      </>
    ),
  },
  {
    title: 'Open World',
    Svg: require('@site/static/img/earth.svg').default,
    description: (
      <>
        It's up to you and your teammates where strikes will happen.
        Strategy, coordination and execution are paramount here. 
      </>
    ),
  },
];

function Feature({title, Svg, description}: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" />
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
