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
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = rint((*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _55 = precise::max(_53, 0.0);
    uint _58 = uint(_55);
    uint _60 = clamp(_58, 0u, 65535u);
    float _62 = 1.0 / _39;
    float _64 = _62 * _45;
    float _66 = _62 * _51;
    float _68 = floor(_64);
    float _70 = floor(_66);
    float _72 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _74 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _72);
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _78 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _80 = _74 + _78;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _84 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _82);
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _88 = _84 + _86;
    float _90 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _92 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _84);
    float3 _261 = float3(_84, _80, float(int(_60)));
    float3 _266 = select(_261, float3(0.0), isnan(_261));
    float _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _266.xy, uint(rint(_266.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _266.xy, uint(rint(_266.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _277 = float3(_88, _80, float(int(_60)));
    float3 _279 = select(_277, float3(0.0), isnan(_277));
    float _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _279.xy, uint(rint(_279.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _279.xy, uint(rint(_279.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _290 = float3(_90, _80, float(int(_60)));
    float3 _292 = select(_290, float3(0.0), isnan(_290));
    float _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _292.xy, uint(rint(_292.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _292.xy, uint(rint(_292.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _303 = float3(_84, _76, float(int(_60)));
    float3 _305 = select(_303, float3(0.0), isnan(_303));
    float _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _305.xy, uint(rint(_305.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _305.xy, uint(rint(_305.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _316 = float3(_92, _80, float(int(_60)));
    float3 _318 = select(_316, float3(0.0), isnan(_316));
    float _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _318.xy, uint(rint(_318.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _318.xy, uint(rint(_318.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _329 = float3(_88, _76, float(int(_60)));
    float3 _331 = select(_329, float3(0.0), isnan(_329));
    float _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _331.xy, uint(rint(_331.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _331.xy, uint(rint(_331.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _342 = float3(_84, _74, float(int(_60)));
    float3 _344 = select(_342, float3(0.0), isnan(_342));
    float _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _344.xy, uint(rint(_344.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _344.xy, uint(rint(_344.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _355 = float3(_90, _76, float(int(_60)));
    float3 _357 = select(_355, float3(0.0), isnan(_355));
    float _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _357.xy, uint(rint(_357.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _357.xy, uint(rint(_357.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _368 = float3(_88, _74, float(int(_60)));
    float3 _370 = select(_368, float3(0.0), isnan(_368));
    float _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _370.xy, uint(rint(_370.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _370.xy, uint(rint(_370.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _381 = float3(_92, _76, float(int(_60)));
    float3 _383 = select(_381, float3(0.0), isnan(_381));
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _383.xy, uint(rint(_383.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _383.xy, uint(rint(_383.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _394 = float3(_90, _74, float(int(_60)));
    float3 _396 = select(_394, float3(0.0), isnan(_394));
    float _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _396.xy, uint(rint(_396.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _396.xy, uint(rint(_396.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float _116 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _74);
    float3 _411 = float3(_84, _116, float(int(_60)));
    float3 _413 = select(_411, float3(0.0), isnan(_411));
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _413.xy, uint(rint(_413.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _413.xy, uint(rint(_413.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _424 = float3(_88, _116, float(int(_60)));
    float3 _426 = select(_424, float3(0.0), isnan(_424));
    float _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _426.xy, uint(rint(_426.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _426.xy, uint(rint(_426.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _437 = float3(_92, _74, float(int(_60)));
    float3 _439 = select(_437, float3(0.0), isnan(_437));
    float _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _439.xy, uint(rint(_439.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _439.xy, uint(rint(_439.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _450 = float3(_90, _116, float(int(_60)));
    float3 _452 = select(_450, float3(0.0), isnan(_450));
    float _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _452.xy, uint(rint(_452.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _452.xy, uint(rint(_452.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float3 _463 = float3(_92, _116, float(int(_60)));
    float3 _465 = select(_463, float3(0.0), isnan(_463));
    float _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _465.xy, uint(rint(_465.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _465.xy, uint(rint(_465.z)), level((*spvDescriptorSet0.fp_c3)._m0[3].y)).x;
    float _128 = _94 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _130 = _100 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _132 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[16].x, _128);
    float _134 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[18].x, _130);
    float _136 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[16].z, _132);
    float _138 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[16].w, _136);
    float _140 = _106 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _142 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].z, _134);
    float _144 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[17].x, _140);
    float _146 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[18].w, _142);
    float _148 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[17].z, _144);
    float _150 = _118 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _152 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[17].w, _148);
    float _154 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[19].x, _150);
    float _156 = _138 + _152;
    float _158 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[19].z, _154);
    float _160 = _156 + _146;
    float _162 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[19].w, _158);
    float _164 = _160 + _162;
    out.m_32.x = _164;
    out.m_32.y = 0.0;
    out.m_32.z = 0.0;
    out.m_32.w = 0.0;
    return out;
}

