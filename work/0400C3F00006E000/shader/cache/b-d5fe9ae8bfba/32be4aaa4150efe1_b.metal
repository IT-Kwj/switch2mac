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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
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
    float3 _284 = float3(_69, _67, float(int(_78)));
    float3 _288 = select(_284, float3(0.0), isnan(_284));
    float _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _288.xy, uint(rint(_288.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _288.xy, uint(rint(_288.z))).w;
    float _82 = (-0.0) + _80;
    bool _86 = _82 > 0.0;
    bool _88 = isnan(_82);
    bool _90 = _86 || _88;
    bool _92 = isnan(0.0);
    bool _94 = _90 || _92;
    float _96 = _65;
    float _98 = _69;
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
    float _100 = in.m_36.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_36.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_36.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_36.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    bool _124 = _82 >= 0.540000021457672119140625;
    bool _126 = isnan(_82);
    bool _128 = _124 || _126;
    bool _130 = isnan(0.540000021457672119140625);
    bool _132 = _128 || _130;
    if (_132)
    {
        _96 = 2.0;
    }
    float _134 = _96;
    if (!_132)
    {
        _98 = 0.0;
    }
    float _136 = _98;
    float _138 = _136;
    if (_132)
    {
        float _140 = fma(_82, _134, -1.0);
        _138 = _140;
    }
    float _142 = _138;
    float _144 = _63 * _104;
    float _146 = _104;
    if (!_132)
    {
        float _148 = _82 * 2.0;
        _146 = _148;
    }
    float _150 = _146;
    float _152 = _63 * _110;
    float _154 = _63 * _116;
    float _156 = _63 * _122;
    bool _158 = _144 > 0.0;
    float _160 = _150;
    if (_132)
    {
        _160 = 1.0;
    }
    float _162 = _160;
    bool _164 = !_158;
    if (!_164)
    {
        bool _166 = 0 != as_type<int>((*spvDescriptorSet0.fp_c4)._m0[0].x);
        float _168 = _162 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
        bool _170 = !_166;
        float _172 = _170 ? 0.0 : (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _174 = _144 * _168;
        bool _176 = !_166;
        float _178 = _176 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[4].x;
        bool _180 = !_166;
        float _182 = _180 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[4].y;
        bool _184 = !_166;
        float _186 = _184 ? 0.0 : (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _188 = fma(_178, _142, _172);
        bool _190 = !_166;
        float _192 = _190 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[4].z;
        bool _194 = !_166;
        float _196 = _194 ? 0.0 : (*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _198 = fma(_182, _142, _186);
        float _200 = _154 * _188;
        float _202 = fma(_192, _142, _196);
        float _204 = _152 * _198;
        float _206 = _156 * _202;
        out.m_34.x = _200;
        out.m_34.y = _204;
        out.m_34.z = _206;
        out.m_34.w = _174;
        return out;
    }
    float _208 = _162 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _210 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _212 = -_144;
    float _214 = fma(_212, _208, -0.0);
    float _216 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[7].y);
    float _218 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[6].z, (*spvDescriptorSet0.fp_c3)._m0[7].z);
    float _220 = _154 * _210;
    float _222 = _152 * _216;
    float _224 = _156 * _218;
    out.m_34.x = _220;
    out.m_34.y = _222;
    out.m_34.z = _224;
    out.m_34.w = _214;
    return out;
}

