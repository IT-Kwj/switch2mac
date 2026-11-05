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
    constant _16* fp_c4 [[id(1)]];
    texture2d_array<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _43;
    float _65 = _63 * _49;
    float _67 = _63 * _55;
    float _69 = _63 * _61;
    float _71 = rint(_65);
    float _73 = precise::max(_71, 0.0);
    uint _76 = uint(_73);
    uint _78 = clamp(_76, 0u, 65535u);
    float3 _246 = float3(_69, _67, float(int(_78)));
    float3 _250 = select(_246, float3(0.0), isnan(_246));
    float _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _250.xy, uint(rint(_250.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _250.xy, uint(rint(_250.z))).w;
    float _82 = (-0.0) + _80;
    bool _86 = _82 > 0.0;
    bool _88 = isnan(_82);
    bool _90 = _86 || _88;
    bool _92 = isnan(0.0);
    bool _94 = _90 || _92;
    if (!_94)
    {
        discard_fragment();
    }
    if (!_94)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _96 = in.m_36.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_36.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_36.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_36.z;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    bool _120 = _82 >= 0.540000021457672119140625;
    bool _122 = isnan(_82);
    bool _124 = _120 || _122;
    bool _126 = isnan(0.540000021457672119140625);
    bool _128 = _124 || _126;
    float _130 = _63 * _100;
    float _132 = fma(_82, 2.0, -1.0);
    float _134 = _63 * _106;
    float _136 = _63 * _112;
    float _138 = _63 * _118;
    bool _140 = _130 > 0.0;
    float _142 = _128 ? _132 : 0.0;
    bool _144 = !_140;
    if (!_144)
    {
        float _146 = _142 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _148 = (*spvDescriptorSet0.fp_c3)._m0[5].y + (*spvDescriptorSet0.fp_c3)._m0[4].y;
        bool _150 = 0 != as_type<int>((*spvDescriptorSet0.fp_c4)._m0[0].x);
        float _152 = (*spvDescriptorSet0.fp_c3)._m0[5].x + (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _154 = _130 * _146;
        float _156 = (*spvDescriptorSet0.fp_c3)._m0[5].z + (*spvDescriptorSet0.fp_c3)._m0[4].z;
        float _158 = _150 ? _148 : 1.0;
        float _160 = _150 ? _152 : 1.0;
        float _162 = _150 ? _156 : 1.0;
        float _164 = _134 * _158;
        float _166 = _136 * _160;
        float _168 = _138 * _162;
        out.m_34.x = _166;
        out.m_34.y = _164;
        out.m_34.z = _168;
        out.m_34.w = _154;
        return out;
    }
    float _170 = _142 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _172 = (*spvDescriptorSet0.fp_c3)._m0[7].y + (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _174 = -_130;
    float _176 = fma(_174, _170, -0.0);
    float _178 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _180 = (*spvDescriptorSet0.fp_c3)._m0[7].z + (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _182 = _134 * _172;
    float _184 = _136 * _178;
    float _186 = _138 * _180;
    out.m_34.x = _184;
    out.m_34.y = _182;
    out.m_34.z = _186;
    out.m_34.w = _176;
    return out;
}

