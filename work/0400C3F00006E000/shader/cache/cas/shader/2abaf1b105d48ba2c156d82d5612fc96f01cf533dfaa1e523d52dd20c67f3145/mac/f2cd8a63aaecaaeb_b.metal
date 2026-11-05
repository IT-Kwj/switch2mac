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
    float _76 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _74);
    float _78 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _80 = _74 + _78;
    float _82 = _74 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _84);
    float _88 = _86 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _90 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _86);
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _94 = _86 + _92;
    float3 _265 = float3(_86, _74, float(int(_60)));
    float3 _270 = select(_265, float3(0.0), isnan(_265));
    float _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _270.xy, uint(rint(_270.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _270.xy, uint(rint(_270.z)), level(0.0)).x;
    float3 _279 = float3(_94, _74, float(int(_60)));
    float3 _281 = select(_279, float3(0.0), isnan(_279));
    float _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _281.xy, uint(rint(_281.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _281.xy, uint(rint(_281.z)), level(0.0)).x;
    float3 _290 = float3(_88, _74, float(int(_60)));
    float3 _292 = select(_290, float3(0.0), isnan(_290));
    float _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _292.xy, uint(rint(_292.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _292.xy, uint(rint(_292.z)), level(0.0)).x;
    float3 _301 = float3(_90, _74, float(int(_60)));
    float3 _303 = select(_301, float3(0.0), isnan(_301));
    float _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _303.xy, uint(rint(_303.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _303.xy, uint(rint(_303.z)), level(0.0)).x;
    float3 _312 = float3(_86, _80, float(int(_60)));
    float3 _314 = select(_312, float3(0.0), isnan(_312));
    float _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _314.xy, uint(rint(_314.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _314.xy, uint(rint(_314.z)), level(0.0)).x;
    float3 _323 = float3(_94, _80, float(int(_60)));
    float3 _325 = select(_323, float3(0.0), isnan(_323));
    float _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _325.xy, uint(rint(_325.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _325.xy, uint(rint(_325.z)), level(0.0)).x;
    float3 _334 = float3(_88, _80, float(int(_60)));
    float3 _336 = select(_334, float3(0.0), isnan(_334));
    float _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _336.xy, uint(rint(_336.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _336.xy, uint(rint(_336.z)), level(0.0)).x;
    float3 _345 = float3(_90, _80, float(int(_60)));
    float3 _347 = select(_345, float3(0.0), isnan(_345));
    float _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _347.xy, uint(rint(_347.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _347.xy, uint(rint(_347.z)), level(0.0)).x;
    float3 _356 = float3(_86, _82, float(int(_60)));
    float3 _358 = select(_356, float3(0.0), isnan(_356));
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _358.xy, uint(rint(_358.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _358.xy, uint(rint(_358.z)), level(0.0)).x;
    float3 _367 = float3(_86, _76, float(int(_60)));
    float3 _369 = select(_367, float3(0.0), isnan(_367));
    float _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _369.xy, uint(rint(_369.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _369.xy, uint(rint(_369.z)), level(0.0)).x;
    float3 _378 = float3(_94, _82, float(int(_60)));
    float3 _380 = select(_378, float3(0.0), isnan(_378));
    float _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _380.xy, uint(rint(_380.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _380.xy, uint(rint(_380.z)), level(0.0)).x;
    float3 _389 = float3(_94, _76, float(int(_60)));
    float3 _391 = select(_389, float3(0.0), isnan(_389));
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _391.xy, uint(rint(_391.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _391.xy, uint(rint(_391.z)), level(0.0)).x;
    float3 _400 = float3(_88, _82, float(int(_60)));
    float3 _402 = select(_400, float3(0.0), isnan(_400));
    float _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _402.xy, uint(rint(_402.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _402.xy, uint(rint(_402.z)), level(0.0)).x;
    float3 _411 = float3(_88, _76, float(int(_60)));
    float3 _413 = select(_411, float3(0.0), isnan(_411));
    float _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _413.xy, uint(rint(_413.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _413.xy, uint(rint(_413.z)), level(0.0)).x;
    float3 _422 = float3(_90, _82, float(int(_60)));
    float3 _424 = select(_422, float3(0.0), isnan(_422));
    float _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _424.xy, uint(rint(_424.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _424.xy, uint(rint(_424.z)), level(0.0)).x;
    float3 _433 = float3(_90, _76, float(int(_60)));
    float3 _435 = select(_433, float3(0.0), isnan(_433));
    float _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _435.xy, uint(rint(_435.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _435.xy, uint(rint(_435.z)), level(0.0)).x;
    float _128 = _96 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _130 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[17].x, _128);
    float _132 = _104 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _134 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[17].z, _130);
    float _136 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[16].x, _132);
    float _138 = _112 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _140 = _114 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _142 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[17].w, _134);
    float _144 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].z, _136);
    float _146 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[18].x, _138);
    float _148 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[19].x, _140);
    float _150 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[16].w, _144);
    float _152 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[18].z, _146);
    float _154 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[19].z, _148);
    float _156 = _150 + _142;
    float _158 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[18].w, _152);
    float _160 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[19].w, _154);
    float _162 = _156 + _158;
    float _164 = _162 + _160;
    out.m_32.x = _164;
    out.m_32.y = 0.0;
    out.m_32.z = 0.0;
    out.m_32.w = 0.0;
    return out;
}

