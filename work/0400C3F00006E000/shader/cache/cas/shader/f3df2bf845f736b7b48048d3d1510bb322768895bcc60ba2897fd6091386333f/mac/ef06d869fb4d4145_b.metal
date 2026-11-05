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
    texturecube_array<float> fp_t_tcb_8 [[id(1)]];
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
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_29.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _41;
    float _63 = _61 * _47;
    float _65 = _61 * _53;
    float _67 = _61 * _59;
    float _69 = abs(_63);
    float _71 = abs(_65);
    float _73 = precise::max(_69, _71);
    float _75 = abs(_67);
    float _77 = precise::max(_75, _73);
    float _79 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[0].z));
    float _81 = 1.0 / _77;
    float _83 = rint(_79);
    float _85 = precise::max(_83, 0.0);
    uint _88 = uint(_85);
    uint _90 = clamp(_88, 0u, 65535u);
    float _92 = _63 * _81;
    float _94 = _65 * _81;
    float _96 = _67 * _81;
    float4 _242 = float4(_92, _94, _96, float(int(_90)));
    float4 _247 = select(_242, float4(0.0), isnan(_242));
    float3 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _247.xyz, uint(rint(_247.w)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _247.xyz, uint(rint(_247.w)), level((*spvDescriptorSet0.fp_c3)._m0[0].w)).xyz;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = in.m_31.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _116 = precise::max(_102, _104);
    float _118 = precise::max(_106, _116);
    float _120 = _61 * _112;
    float _122 = fma(_118, -4.0, 1.0);
    float _124 = 1.0 / _120;
    float _126 = floor(_122);
    float _128 = -_126;
    float _130 = _122 + _128;
    float _132 = fma(_130, 0.25, _118);
    float _134 = precise::max(_132, 0.00390625);
    float _136 = 1.0 / _134;
    float _138 = _134 * _124;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = abs(_140);
    float _144 = log2(_142);
    float _146 = _102 * _136;
    float _148 = _104 * _136;
    float _150 = _106 * _136;
    float _152 = _144 * _114;
    float _154 = exp2(_152);
    out.m_34.x = _146;
    out.m_34.y = _148;
    out.m_34.z = _150;
    out.m_34.w = _154;
    return out;
}

