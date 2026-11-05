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
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _61 = 1.0 / _39;
    float _63 = _61 * _45;
    float _65 = _61 * _51;
    float _67 = _61 * _57;
    float _69 = fma(_59, -0.5, _65);
    float _71 = rint(_63);
    float _73 = precise::max(_71, 0.0);
    uint _76 = uint(_73);
    uint _78 = clamp(_76, 0u, 65535u);
    float _80 = fma(_59, -0.5, _67);
    float _82 = fma(_59, 0.5, _67);
    float3 _253 = float3(_80, _69, float(int(_78)));
    float3 _257 = select(_253, float3(0.0), isnan(_253));
    float2 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _257.xy, uint(rint(_257.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _257.xy, uint(rint(_257.z))).xy;
    float _88 = _86.x;
    float _90 = _86.y;
    float3 _270 = float3(_82, _69, float(int(_78)));
    float3 _272 = select(_270, float3(0.0), isnan(_270));
    float2 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _272.xy, uint(rint(_272.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _272.xy, uint(rint(_272.z))).xy;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = fma(_59, 1.5, _67);
    float _100 = fma(_59, 0.5, _65);
    float _102 = fma(_59, 1.5, _65);
    float3 _295 = float3(_98, _69, float(int(_78)));
    float3 _297 = select(_295, float3(0.0), isnan(_295));
    float _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _297.xy, uint(rint(_297.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _297.xy, uint(rint(_297.z))).x;
    float3 _306 = float3(_98, _100, float(int(_78)));
    float3 _308 = select(_306, float3(0.0), isnan(_306));
    float _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _308.xy, uint(rint(_308.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _308.xy, uint(rint(_308.z))).x;
    float3 _317 = float3(_82, _102, float(int(_78)));
    float3 _319 = select(_317, float3(0.0), isnan(_317));
    float _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _319.xy, uint(rint(_319.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _319.xy, uint(rint(_319.z))).x;
    float3 _328 = float3(_98, _102, float(int(_78)));
    float3 _330 = select(_328, float3(0.0), isnan(_328));
    float _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _330.xy, uint(rint(_330.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _330.xy, uint(rint(_330.z))).x;
    float3 _339 = float3(_80, _102, float(int(_78)));
    float3 _341 = select(_339, float3(0.0), isnan(_339));
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _341.xy, uint(rint(_341.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _341.xy, uint(rint(_341.z))).x;
    float3 _350 = float3(_80, _100, float(int(_78)));
    float3 _352 = select(_350, float3(0.0), isnan(_350));
    float2 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _352.xy, uint(rint(_352.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _352.xy, uint(rint(_352.z))).xy;
    float _116 = _114.x;
    float _118 = _114.y;
    float3 _365 = float3(_82, _100, float(int(_78)));
    float3 _367 = select(_365, float3(0.0), isnan(_365));
    float2 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _367.xy, uint(rint(_367.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _367.xy, uint(rint(_367.z))).xy;
    float _122 = _120.x;
    float _124 = _120.y;
    bool _128 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[3].y;
    bool _130 = isnan(0.0);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _136 = _132 || _134;
    float _138 = precise::max(_88, _94);
    if (!_136)
    {
        float _140 = precise::max(_122, _106);
        float _142 = precise::max(_112, _108);
        float _144 = precise::min(_122, _106);
        float _146 = precise::min(_112, _108);
        float _148 = precise::max(_104, _116);
        float _150 = precise::max(_140, _142);
        float _152 = precise::min(_88, _94);
        float _154 = precise::min(_104, _116);
        float _156 = precise::min(_144, _146);
        float _158 = precise::max(_138, _148);
        float _160 = precise::max(_110, _150);
        float _162 = precise::min(_152, _154);
        float _164 = precise::min(_110, _156);
        float _166 = precise::max(_158, _160);
        float _168 = precise::min(_162, _164);
        out.m_32.x = _166;
        out.m_32.y = _168;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return out;
    }
    float _170 = precise::max(_116, _122);
    float _172 = precise::min(_90, _96);
    float _174 = precise::min(_118, _124);
    float _176 = precise::max(_138, _170);
    float _178 = precise::min(_172, _174);
    out.m_32.x = _176;
    out.m_32.y = _178;
    out.m_32.z = 0.0;
    out.m_32.w = 0.0;
    return out;
}

