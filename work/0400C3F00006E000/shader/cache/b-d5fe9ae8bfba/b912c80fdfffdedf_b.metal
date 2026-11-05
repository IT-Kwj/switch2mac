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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _49;
    float _71 = _69 * _55;
    float _73 = _69 * _61;
    float _75 = _69 * _67;
    float _77 = _71 * _71;
    float _79 = fma(_73, _73, _77);
    float _81 = fma(_75, _75, _79);
    float _83 = rsqrt(_81);
    float _85 = _71 * _83;
    float _87 = _73 * _83;
    float _89 = _75 * _83;
    float _91 = _85 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _93 = _85 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _95 = fma(_87, (*spvDescriptorSet0.fp_c5)._m0[2].x, _91);
    float _97 = fma(_93, 0.5, 0.5);
    float _99 = fma(_89, (*spvDescriptorSet0.fp_c5)._m0[2].z, _95);
    float _101 = fma(_99, 0.5, 0.5);
    float2 _329 = float2(_101, _97);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_329, float2(0.0), isnan(_329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_329, float2(0.0), isnan(_329))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float _114 = in.m_37.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _122 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[12].z, _120);
    float _124 = precise::clamp(_122, 0.0, 1.0);
    float _126 = _69 * _118;
    bool _130 = _93 >= _126;
    float _132 = _126;
    float _134 = _99;
    float _136 = (*spvDescriptorSet0.fp_c4)._m0[12].z;
    if (!_130)
    {
        _132 = 0.0;
    }
    float _138 = _132;
    float _140 = _138;
    if (!_130)
    {
        _134 = 0.0;
        _136 = 0.0;
    }
    float _142 = _134;
    float _144 = _136;
    bool _146 = !_130;
    float _148 = _142;
    float _150 = _144;
    if (!_146)
    {
        float _152 = in.m_39.x;
        float _154 = gl_FragCoord.w;
        float _156 = _152 * _154;
        float _158 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _160 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _158;
        float _162 = 1.0 / _160;
        float _164 = _69 * _156;
        float _166 = fma(_93, 350.80767822265625, 53.62115478515625);
        float _168 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _170 = _164 + _168;
        float _172 = log2(_166);
        float _174 = _170 * _162;
        float _176 = sqrt(_174);
        float _178 = _172 * 0.1155245304107666015625;
        float2 _435 = float2(_178, _176);
        float3 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_435, float2(0.0), isnan(_435))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_435, float2(0.0), isnan(_435))).xyz;
        float _184 = _182.x;
        float _186 = _182.y;
        float _188 = _182.z;
        _148 = _184;
        _150 = _186;
        _140 = _188;
    }
    float _190 = _148;
    float _192 = _150;
    float _194 = _140;
    float _196 = _106 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _198 = _108 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _200 = _110 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _202 = _112 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _196 * _190;
    float _208 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _210 = _196 + _208;
    float _212 = _198 * _192;
    float _214 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _216 = _198 + _214;
    float _218 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _220 = _200 + _218;
    float _222 = _200 * _194;
    float _224 = _124 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _226 = fma(_204, _210, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _228 = fma(_204, _216, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _230 = fma(_204, _220, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _232 = fma(_206, _224, _226);
    float _234 = fma(_212, _224, _228);
    float _236 = fma(_222, _224, _230);
    out.m_42.x = _232;
    out.m_42.y = _234;
    out.m_42.z = _236;
    out.m_42.w = 1.0;
    return out;
}

