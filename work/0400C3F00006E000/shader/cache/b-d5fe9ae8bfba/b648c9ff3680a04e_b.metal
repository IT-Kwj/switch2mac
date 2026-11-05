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
    float _93 = fma(_87, (*spvDescriptorSet0.fp_c5)._m0[2].x, _91);
    float _95 = fma(_89, (*spvDescriptorSet0.fp_c5)._m0[2].z, _93);
    float _97 = fma(_95, -0.5, 0.5);
    float _99 = fma(_95, 0.5, 0.5);
    float _101 = fma(_99, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _103 = sqrt(_97);
    float _105 = fma(_99, _101, -0.212114393711090087890625);
    float _107 = _85 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _109 = fma(_99, _105, 1.570728778839111328125);
    float _111 = fma(_107, 0.5, 0.5);
    float _113 = _103 * 0.636619746685028076171875;
    float _115 = -_109;
    float _117 = fma(_113, _115, 1.0);
    float2 _370 = float2(_117, _111);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_370, float2(0.0), isnan(_370))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_370, float2(0.0), isnan(_370))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    float _130 = in.m_37.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _138 = fma(_95, (*spvDescriptorSet0.fp_c4)._m0[12].z, _136);
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = _69 * _134;
    bool _146 = _107 >= _142;
    float _148 = _142;
    float _150 = _134;
    float _152 = 0.5;
    if (!_146)
    {
        _148 = 0.0;
    }
    float _154 = _148;
    float _156 = _154;
    if (!_146)
    {
        _150 = 0.0;
        _152 = 0.0;
    }
    float _158 = _150;
    float _160 = _152;
    bool _162 = !_146;
    float _164 = _160;
    float _166 = _158;
    if (!_162)
    {
        float _168 = in.m_39.x;
        float _170 = gl_FragCoord.w;
        float _172 = _168 * _170;
        float _174 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _176 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _174;
        float _178 = fma(_107, 350.80767822265625, 53.62115478515625);
        float _180 = 1.0 / _176;
        float _182 = log2(_178);
        float _184 = _69 * _172;
        float _186 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _188 = _184 + _186;
        float _190 = _182 * 0.1155245304107666015625;
        float _192 = _188 * _180;
        float _194 = sqrt(_192);
        float2 _474 = float2(_190, _194);
        float3 _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).xyz;
        float _200 = _198.x;
        float _202 = _198.y;
        float _204 = _198.z;
        _164 = _200;
        _156 = _204;
        _166 = _202;
    }
    float _206 = _164;
    float _208 = _156;
    float _210 = _166;
    float _212 = _122 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _214 = _126 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _216 = _124 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _218 = _128 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = _212 * _206;
    float _224 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _226 = _212 + _224;
    float _228 = _214 * _208;
    float _230 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _232 = _216 + _230;
    float _234 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _236 = _214 + _234;
    float _238 = _216 * _210;
    float _240 = _140 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _242 = fma(_220, _226, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _244 = fma(_220, _232, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _246 = fma(_220, _236, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _248 = fma(_222, _240, _242);
    float _250 = fma(_238, _240, _244);
    float _252 = fma(_228, _240, _246);
    out.m_42.x = _248;
    out.m_42.y = _250;
    out.m_42.z = _252;
    out.m_42.w = 1.0;
    return out;
}

