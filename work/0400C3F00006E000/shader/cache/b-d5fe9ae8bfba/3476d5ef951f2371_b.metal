#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _505 = false;
    bool _467 = false;
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = rint((*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _57 = precise::max(_55, 0.0);
    uint _60 = uint(_57);
    uint _62 = clamp(_60, 0u, 65535u);
    float _64 = 1.0 / _41;
    float _66 = _64 * _47;
    float _68 = _64 * _53;
    float _70 = floor(_68);
    float _72 = floor(_66);
    float _74 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _76 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _78 = _74 + _76;
    float _80 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, -2.0, _74);
    float _82 = _74 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _84 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _88 = _84 + _86;
    float _90 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float3 _729 = float3(_84, _80, float(int(_62)));
    float3 _733 = select(_729, float3(0.0), isnan(_729));
    float _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _733.xy, uint(rint(_733.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _733.xy, uint(rint(_733.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _744 = float3(_88, _80, float(int(_62)));
    float3 _746 = select(_744, float3(0.0), isnan(_744));
    float _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _746.xy, uint(rint(_746.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _746.xy, uint(rint(_746.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _757 = float3(_84, _78, float(int(_62)));
    float3 _759 = select(_757, float3(0.0), isnan(_757));
    float _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _759.xy, uint(rint(_759.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _759.xy, uint(rint(_759.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float _98 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, -2.0, _84);
    float _100 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _84);
    float3 _779 = float3(_88, _82, float(int(_62)));
    float3 _781 = select(_779, float3(0.0), isnan(_779));
    float _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _781.xy, uint(rint(_781.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _781.xy, uint(rint(_781.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _792 = float3(_90, _80, float(int(_62)));
    float3 _794 = select(_792, float3(0.0), isnan(_792));
    float _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _794.xy, uint(rint(_794.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _794.xy, uint(rint(_794.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _805 = float3(_88, _78, float(int(_62)));
    float3 _807 = select(_805, float3(0.0), isnan(_805));
    float _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _807.xy, uint(rint(_807.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _807.xy, uint(rint(_807.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _818 = float3(_88, _74, float(int(_62)));
    float3 _820 = select(_818, float3(0.0), isnan(_818));
    float _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _820.xy, uint(rint(_820.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _820.xy, uint(rint(_820.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _831 = float3(_98, _80, float(int(_62)));
    float3 _833 = select(_831, float3(0.0), isnan(_831));
    float _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _833.xy, uint(rint(_833.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _833.xy, uint(rint(_833.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _844 = float3(_100, _80, float(int(_62)));
    float3 _846 = select(_844, float3(0.0), isnan(_844));
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _846.xy, uint(rint(_846.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _846.xy, uint(rint(_846.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _857 = float3(_90, _78, float(int(_62)));
    float3 _859 = select(_857, float3(0.0), isnan(_857));
    float _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _859.xy, uint(rint(_859.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _859.xy, uint(rint(_859.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _870 = float3(_84, _82, float(int(_62)));
    float3 _872 = select(_870, float3(0.0), isnan(_870));
    float _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _872.xy, uint(rint(_872.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _872.xy, uint(rint(_872.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _883 = float3(_98, _78, float(int(_62)));
    float3 _885 = select(_883, float3(0.0), isnan(_883));
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _885.xy, uint(rint(_885.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _885.xy, uint(rint(_885.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _896 = float3(_90, _82, float(int(_62)));
    float3 _898 = select(_896, float3(0.0), isnan(_896));
    float _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _898.xy, uint(rint(_898.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _898.xy, uint(rint(_898.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _909 = float3(_90, _74, float(int(_62)));
    float3 _911 = select(_909, float3(0.0), isnan(_909));
    float _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _911.xy, uint(rint(_911.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _911.xy, uint(rint(_911.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _922 = float3(_100, _78, float(int(_62)));
    float3 _924 = select(_922, float3(0.0), isnan(_922));
    float _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _924.xy, uint(rint(_924.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _924.xy, uint(rint(_924.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _935 = float3(_84, _74, float(int(_62)));
    float3 _937 = select(_935, float3(0.0), isnan(_935));
    float _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _937.xy, uint(rint(_937.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _937.xy, uint(rint(_937.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _948 = float3(_100, _74, float(int(_62)));
    float3 _950 = select(_948, float3(0.0), isnan(_948));
    float _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _950.xy, uint(rint(_950.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _950.xy, uint(rint(_950.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _961 = float3(_100, _82, float(int(_62)));
    float3 _963 = select(_961, float3(0.0), isnan(_961));
    float _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _963.xy, uint(rint(_963.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _963.xy, uint(rint(_963.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _974 = float3(_98, _74, float(int(_62)));
    float3 _976 = select(_974, float3(0.0), isnan(_974));
    float _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _976.xy, uint(rint(_976.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _976.xy, uint(rint(_976.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _987 = float3(_98, _82, float(int(_62)));
    float3 _989 = select(_987, float3(0.0), isnan(_987));
    float _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _989.xy, uint(rint(_989.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _989.xy, uint(rint(_989.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float _136 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _74);
    float3 _1004 = float3(_88, _136, float(int(_62)));
    float3 _1006 = select(_1004, float3(0.0), isnan(_1004));
    float _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1006.xy, uint(rint(_1006.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1006.xy, uint(rint(_1006.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _1017 = float3(_98, _136, float(int(_62)));
    float3 _1019 = select(_1017, float3(0.0), isnan(_1017));
    float _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1019.xy, uint(rint(_1019.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1019.xy, uint(rint(_1019.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _1030 = float3(_84, _136, float(int(_62)));
    float3 _1032 = select(_1030, float3(0.0), isnan(_1030));
    float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1032.xy, uint(rint(_1032.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1032.xy, uint(rint(_1032.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _1043 = float3(_90, _136, float(int(_62)));
    float3 _1045 = select(_1043, float3(0.0), isnan(_1043));
    float _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1045.xy, uint(rint(_1045.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1045.xy, uint(rint(_1045.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _1056 = float3(_100, _136, float(int(_62)));
    float3 _1058 = select(_1056, float3(0.0), isnan(_1056));
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1058.xy, uint(rint(_1058.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1058.xy, uint(rint(_1058.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float _148 = in.m_31.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_31.y;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _64 * _152;
    float _162 = _64 * _158;
    float _164 = _160 * 0.5;
    float _166 = _162 * 0.5;
    float _168 = floor(_160);
    float _170 = floor(_164);
    float _172 = floor(_162);
    float _174 = floor(_166);
    float _176 = fma(_170, -2.0, _168);
    float _178 = fma(_174, -2.0, _172);
    float _180 = fma(_178, 2.0, _176);
    float _182 = trunc(_180);
    int _185 = int(_182);
    bool _189 = _185 >= 2;
    float _191 = _92 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _193 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[16].x, _191);
    float _195 = _94 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _197 = precise::max(_96, _102);
    float _199 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[16].z, _193);
    float _201 = precise::min(_96, _102);
    float _203 = _106 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _205 = precise::max(_106, _108);
    float _207 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[16].x, _195);
    float _209 = precise::min(_106, _108);
    float _211 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[16].w, _199);
    float _213 = precise::max(_205, _197);
    float _215 = _96 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _217 = precise::min(_209, _201);
    float _219 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[17].x, _215);
    float _221 = precise::min(_114, _116);
    float _223 = _116 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _225 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[17].x, _203);
    float _227 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[16].z, _207);
    float _229 = precise::max(_114, _116);
    float _231 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[17].z, _225);
    float _233 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[17].z, _219);
    float _235 = precise::min(_122, _120);
    float _237 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[16].w, _227);
    float _239 = precise::max(_122, _120);
    float _241 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[17].w, _231);
    float _243 = precise::min(_221, _235);
    float _245 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[17].w, _233);
    float _247 = precise::max(_229, _239);
    float _249 = _237 + _241;
    float _251 = precise::min(_217, _243);
    float _253 = _211 + _245;
    float _255 = precise::max(_213, _247);
    float _257 = _108 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _259 = _106 * (*spvDescriptorSet0.fp_c3)._m0[16].x;
    float _261 = _96 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _263 = _108 * (*spvDescriptorSet0.fp_c3)._m0[17].x;
    float _265 = _122 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _267 = _259 + _261;
    float _269 = _126 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _271 = _126 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _273 = _126 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _275 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[16].z, _267);
    float _277 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[9].x, _269);
    float _279 = _257 + _271;
    float _281 = _263 + _273;
    float _283 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[18].x, _223);
    float _285 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[9].z, _277);
    float _287 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[18].z, _279);
    float _289 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[17].z, _281);
    float _291 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[16].w, _275);
    float _293 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[9].w, _285);
    float _295 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[18].w, _287);
    float _297 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[17].w, _289);
    float _299 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[18].z, _283);
    float _301 = _102 * (*spvDescriptorSet0.fp_c3)._m0[19].x;
    float _303 = _116 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _305 = _291 + _297;
    float _307 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[18].w, _299);
    float _309 = _253 + _295;
    float _311 = _301 + _303;
    float _313 = _106 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _315 = _305 + _307;
    float _317 = _108 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _319 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[19].z, _311);
    float _321 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[16].x, _313);
    float _323 = _102 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _325 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[17].x, _317);
    float _327 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[19].w, _319);
    float _329 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[16].z, _321);
    float _331 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[18].x, _323);
    float _333 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[17].z, _325);
    float _335 = _309 + _327;
    float _337 = _108 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _339 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[16].w, _329);
    float _341 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[17].w, _333);
    float _343 = precise::min(_126, _251);
    float _345 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[18].x, _337);
    float _347 = _339 + _341;
    float _349 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[18].z, _331);
    float _351 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[18].z, _345);
    float _353 = _102 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _355 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[18].w, _349);
    float _357 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[18].w, _351);
    float _359 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[19].x, _353);
    float _361 = _96 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _363 = _249 + _357;
    float _365 = _347 + _355;
    float _367 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[19].z, _359);
    float _369 = _106 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _371 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[9].x, _361);
    float _373 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[19].w, _367);
    float _375 = _108 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _377 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[9].x, _369);
    float _379 = _114 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _381 = _363 + _373;
    float _383 = _138 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _385 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[9].x, _375);
    float _387 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[9].x, _379);
    float _389 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[9].x, _375);
    float _391 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[19].x, _383);
    float _393 = _142 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _395 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[9].z, _385);
    float _397 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[9].z, _377);
    float _399 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[19].z, _391);
    float _401 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[19].x, _393);
    float _403 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[9].w, _395);
    float _405 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[9].x, _269);
    float _407 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[9].x, _265);
    float _409 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[19].z, _401);
    float _411 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[9].z, _371);
    float _413 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[9].z, _405);
    float _415 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[9].z, _407);
    float _417 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[19].w, _399);
    float _419 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[19].w, _409);
    float _421 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[9].z, _387);
    float _423 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[9].z, _389);
    float _425 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[9].w, _413);
    float _427 = _365 + _417;
    float _429 = _315 + _419;
    float _431 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[9].w, _415);
    float _433 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[9].w, _397);
    float _435 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[9].w, _411);
    float _437 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[9].w, _421);
    float _439 = precise::max(_126, _255);
    float _441 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[9].w, _423);
    bool _443 = !_189;
    float _503;
    if (!_443)
    {
        bool _445 = _185 >= 3;
        float _447 = _116 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
        float _449 = _102 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
        float _451 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[9].x, _447);
        float _453 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[9].x, _449);
        float _455 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[9].z, _451);
        float _457 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[9].z, _453);
        float _459 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[9].w, _455);
        float _461 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[9].w, _457);
        bool _463 = !_445;
        if (!_463)
        {
            bool _465 = _185 != 3;
            _467 = _465;
            if (!_467)
            {
                float _469 = _435 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
                float _471 = fma(_441, (*spvDescriptorSet0.fp_c3)._m0[17].x, _273);
                float _473 = _425 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
                float _475 = fma(_381, (*spvDescriptorSet0.fp_c3)._m0[16].x, _469);
                float _477 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[17].z, _471);
                float _479 = fma(_427, (*spvDescriptorSet0.fp_c3)._m0[18].x, _473);
                float _481 = fma(_461, (*spvDescriptorSet0.fp_c3)._m0[19].x, _303);
                float _483 = fma(_335, (*spvDescriptorSet0.fp_c3)._m0[16].z, _475);
                float _485 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[17].w, _477);
                float _487 = fma(_429, (*spvDescriptorSet0.fp_c3)._m0[18].z, _479);
                float _489 = fma(_459, (*spvDescriptorSet0.fp_c3)._m0[19].z, _481);
                float _491 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[16].w, _483);
                float _493 = fma(_431, (*spvDescriptorSet0.fp_c3)._m0[18].w, _487);
                float _495 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[19].w, _489);
                float _497 = _491 + _485;
                float _499 = _497 + _493;
                float _501 = _499 + _495;
                _503 = _501;
                _505 = true;
            }
        }
        else
        {
            float _507 = _381 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
            float _509 = fma(_441, (*spvDescriptorSet0.fp_c3)._m0[17].y, _263);
            float _511 = _427 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
            float _513 = fma(_461, (*spvDescriptorSet0.fp_c3)._m0[19].y, _301);
            float _515 = fma(_433, (*spvDescriptorSet0.fp_c3)._m0[16].x, _507);
            float _517 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[17].z, _509);
            float _519 = fma(_403, (*spvDescriptorSet0.fp_c3)._m0[18].x, _511);
            float _521 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[19].z, _513);
            float _523 = fma(_435, (*spvDescriptorSet0.fp_c3)._m0[16].z, _515);
            float _525 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[17].w, _517);
            float _527 = fma(_425, (*spvDescriptorSet0.fp_c3)._m0[18].z, _519);
            float _529 = fma(_459, (*spvDescriptorSet0.fp_c3)._m0[19].w, _521);
            float _531 = fma(_335, (*spvDescriptorSet0.fp_c3)._m0[16].w, _523);
            float _533 = fma(_429, (*spvDescriptorSet0.fp_c3)._m0[18].w, _527);
            float _535 = _531 + _525;
            float _537 = _535 + _533;
            float _539 = _537 + _529;
            _503 = _539;
            _505 = true;
        }
    }
    if ((!_505) || _467)
    {
        bool _541;
        float _555;
        float _557;
        if (!_467)
        {
            _541 = _185 >= 1;
            float _543 = _96 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _545 = _106 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _547 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[9].x, _543);
            float _549 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[9].x, _545);
            float _551 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[9].z, _547);
            float _553 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[9].z, _549);
            _555 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[9].w, _551);
            _557 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[9].w, _553);
        }
        if ((!_541) || _467)
        {
            bool _559;
            if (!_467)
            {
                _559 = _185 != 0;
            }
            if ((!_559) && (!_467))
            {
                float _561 = _381 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
                float _563 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[16].y, _259);
                float _565 = _108 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
                float _567 = _427 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
                float _569 = fma(_433, (*spvDescriptorSet0.fp_c3)._m0[17].x, _561);
                float _571 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[16].z, _563);
                float _573 = fma(_441, (*spvDescriptorSet0.fp_c3)._m0[18].y, _565);
                float _575 = fma(_403, (*spvDescriptorSet0.fp_c3)._m0[19].x, _567);
                float _577 = fma(_435, (*spvDescriptorSet0.fp_c3)._m0[17].z, _569);
                float _579 = fma(_555, (*spvDescriptorSet0.fp_c3)._m0[16].w, _571);
                float _581 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[18].z, _573);
                float _583 = fma(_425, (*spvDescriptorSet0.fp_c3)._m0[19].z, _575);
                float _585 = fma(_335, (*spvDescriptorSet0.fp_c3)._m0[17].w, _577);
                float _587 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[18].w, _581);
                float _589 = fma(_429, (*spvDescriptorSet0.fp_c3)._m0[19].w, _583);
                float _591 = _579 + _585;
                float _593 = _591 + _587;
                float _595 = _593 + _589;
                _503 = _595;
                _505 = true;
            }
            else
            {
                _467 = false;
                _503 = 0.0;
                _505 = true;
            }
        }
        else
        {
            float _597 = _435 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
            float _599 = fma(_557, (*spvDescriptorSet0.fp_c3)._m0[16].x, _261);
            float _601 = fma(_441, (*spvDescriptorSet0.fp_c3)._m0[18].x, _271);
            float _603 = _425 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
            float _605 = fma(_381, (*spvDescriptorSet0.fp_c3)._m0[17].x, _597);
            float _607 = fma(_555, (*spvDescriptorSet0.fp_c3)._m0[16].z, _599);
            float _609 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[18].z, _601);
            float _611 = fma(_427, (*spvDescriptorSet0.fp_c3)._m0[19].x, _603);
            float _613 = fma(_335, (*spvDescriptorSet0.fp_c3)._m0[17].z, _605);
            float _615 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[16].w, _607);
            float _617 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[18].w, _609);
            float _619 = fma(_429, (*spvDescriptorSet0.fp_c3)._m0[19].z, _611);
            float _621 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[17].w, _613);
            float _623 = fma(_431, (*spvDescriptorSet0.fp_c3)._m0[19].w, _619);
            float _625 = _615 + _621;
            float _627 = _625 + _617;
            float _629 = _627 + _623;
            _503 = _629;
        }
    }
    _505 = false;
    float _631 = _503;
    float _633 = precise::max(_343, _631);
    float _635 = precise::min(_439, _633);
    out.m_34.x = _635;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = 0.0;
    return out;
}

